; DESCRIPTION: Composite: Renders a green disk with center (271, 86) and radius 67 then Renders a blue box of size 10x82 starting at (446, 65) then Sets a single yellow pixel at (448, 192).
; PLAN: r0=271(x), r1=86(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=65(y), r7=10(width), r8=82(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=448(x), r11=192(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 271
LDI r1, 86
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 65
LDI r7, 10
LDI r8, 82
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 192
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
