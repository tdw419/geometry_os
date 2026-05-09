; DESCRIPTION: Composite: Places a white line segment connecting (21, 240) to (112, 134) then Draws a orange rectangle at (15, 47) with width 37 and height 78 then Places a yellow dot at position (208, 65).
; PLAN: r0=21(x1), r1=240(y1), r2=112(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=15(x), r6=47(y), r7=37(width), r8=78(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x), r11=65(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 21
LDI r1, 240
LDI r2, 112
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 47
LDI r7, 37
LDI r8, 78
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 65
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
