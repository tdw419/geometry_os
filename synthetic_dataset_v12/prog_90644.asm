; DESCRIPTION: Composite: Renders a purple box of size 74x115 starting at (218, 52) then Renders a green disk with center (136, 133) and radius 70.
; PLAN: r0=218(x), r1=52(y), r2=74(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=133(y), r7=70(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 218
LDI r1, 52
LDI r2, 74
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 133
LDI r7, 70
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
