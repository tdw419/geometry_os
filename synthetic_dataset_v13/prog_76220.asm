; DESCRIPTION: Places a white 11x29 rectangle at position (437, 30).
; PLAN: r0=437(x), r1=30(y), r2=11(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 30
LDI r2, 11
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
