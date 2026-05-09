; DESCRIPTION: Renders a white box of size 115x83 starting at (205, 165).
; PLAN: r0=205(x), r1=165(y), r2=115(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 165
LDI r2, 115
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
