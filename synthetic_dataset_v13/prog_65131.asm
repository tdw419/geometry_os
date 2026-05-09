; DESCRIPTION: Composite: Creates a green rectangular region at (180, 94) spanning 106 by 59 pixels then Renders a green line between points (317, 13) and (182, 12) then Sets a single yellow pixel at (18, 32).
; PLAN: r0=180(x), r1=94(y), r2=106(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x1), r6=13(y1), r7=182(x2), r8=12(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=18(x), r11=32(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 180
LDI r1, 94
LDI r2, 106
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 13
LDI r7, 182
LDI r8, 12
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 18
LDI r11, 32
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
