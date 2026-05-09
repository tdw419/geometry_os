; DESCRIPTION: Renders a red box of size 115x37 starting at (87, 189).
; PLAN: r0=87(x), r1=189(y), r2=115(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 189
LDI r2, 115
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
