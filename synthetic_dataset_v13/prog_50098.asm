; DESCRIPTION: Places a white 53x45 rectangle at position (437, 165).
; PLAN: r0=437(x), r1=165(y), r2=53(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 165
LDI r2, 53
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
