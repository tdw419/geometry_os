; DESCRIPTION: Places a white 96x13 rectangle at position (36, 106).
; PLAN: r0=36(x), r1=106(y), r2=96(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 106
LDI r2, 96
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
