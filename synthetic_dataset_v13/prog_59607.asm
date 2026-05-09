; DESCRIPTION: Composite: Places a blue line segment connecting (242, 228) to (264, 1) then Draws a orange rectangle at (108, 10) with width 102 and height 89 then Renders a green disk with center (286, 179) and radius 28.
; PLAN: r0=242(x1), r1=228(y1), r2=264(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=10(y), r7=102(width), r8=89(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=286(x), r11=179(y), r12=28(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 242
LDI r1, 228
LDI r2, 264
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 10
LDI r7, 102
LDI r8, 89
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 179
LDI r12, 28
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
