; DESCRIPTION: Composite: Renders a cyan line between points (24, 236) and (398, 207) then Draws a magenta rectangle at (50, 107) with width 105 and height 78 then Renders a yellow disk with center (205, 61) and radius 48.
; PLAN: r0=24(x1), r1=236(y1), r2=398(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=107(y), r7=105(width), r8=78(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x), r11=61(y), r12=48(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 24
LDI r1, 236
LDI r2, 398
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 107
LDI r7, 105
LDI r8, 78
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 61
LDI r12, 48
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
