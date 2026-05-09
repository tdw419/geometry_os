; DESCRIPTION: Composite: Places a blue line segment connecting (443, 182) to (510, 182) then Creates a cyan rectangular region at (313, 52) spanning 54 by 14 pixels then Places a green dot at position (424, 164).
; PLAN: r0=443(x1), r1=182(y1), r2=510(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=52(y), r7=54(width), r8=14(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=424(x), r11=164(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 443
LDI r1, 182
LDI r2, 510
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 52
LDI r7, 54
LDI r8, 14
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 424
LDI r11, 164
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
