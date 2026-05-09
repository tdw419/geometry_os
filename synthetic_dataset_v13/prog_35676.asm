; DESCRIPTION: Composite: Places a red 20x99 rectangle at position (453, 15) then Draws a black line from (371, 129) to (75, 216) then Places a yellow dot at position (314, 36).
; PLAN: r0=453(x), r1=15(y), r2=20(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x1), r6=129(y1), r7=75(x2), r8=216(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=314(x), r11=36(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 453
LDI r1, 15
LDI r2, 20
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 129
LDI r7, 75
LDI r8, 216
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 36
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
