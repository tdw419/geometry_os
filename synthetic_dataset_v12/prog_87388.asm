; DESCRIPTION: Composite: Places a cyan dot at position (244, 39) then Places a green line segment connecting (100, 186) to (432, 83) then Renders a green disk with center (392, 164) and radius 40.
; PLAN: r0=244(x), r1=39(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=100(x1), r6=186(y1), r7=432(x2), r8=83(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=392(x), r11=164(y), r12=40(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 244
LDI r1, 39
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 100
LDI r6, 186
LDI r7, 432
LDI r8, 83
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 164
LDI r12, 40
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
