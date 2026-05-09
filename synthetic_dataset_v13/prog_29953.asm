; DESCRIPTION: Places a white 96x53 rectangle at position (380, 80).
; PLAN: r0=380(x), r1=80(y), r2=96(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 80
LDI r2, 96
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
