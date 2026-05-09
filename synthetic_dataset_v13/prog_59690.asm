; DESCRIPTION: Composite: Renders a green box of size 27x110 starting at (310, 22) then Places a cyan line segment connecting (290, 155) to (479, 194) then Places a red circle of radius 35 at center (69, 44).
; PLAN: r0=310(x), r1=22(y), r2=27(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x1), r6=155(y1), r7=479(x2), r8=194(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=69(x), r11=44(y), r12=35(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 310
LDI r1, 22
LDI r2, 27
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 155
LDI r7, 479
LDI r8, 194
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 44
LDI r12, 35
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
