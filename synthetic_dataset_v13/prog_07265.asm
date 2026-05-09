; DESCRIPTION: Composite: Draws a green line from (271, 96) to (432, 243) then Draws a purple rectangle at (26, 224) with width 19 and height 20.
; PLAN: r0=271(x1), r1=96(y1), r2=432(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=26(x), r6=224(y), r7=19(width), r8=20(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 96
LDI r2, 432
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 224
LDI r7, 19
LDI r8, 20
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
