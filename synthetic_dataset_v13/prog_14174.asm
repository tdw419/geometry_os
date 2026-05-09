; DESCRIPTION: Composite: Places a green line segment connecting (305, 180) to (338, 234) then Renders a green box of size 29x108 starting at (91, 110) then Places a purple dot at position (470, 71).
; PLAN: r0=305(x1), r1=180(y1), r2=338(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=110(y), r7=29(width), r8=108(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=470(x), r11=71(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 305
LDI r1, 180
LDI r2, 338
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 110
LDI r7, 29
LDI r8, 108
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 71
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
