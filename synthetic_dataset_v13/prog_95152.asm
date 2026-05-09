; DESCRIPTION: Composite: Places a green dot at position (166, 186) then Places a purple line segment connecting (218, 57) to (359, 58).
; PLAN: r0=166(x), r1=186(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=218(x1), r6=57(y1), r7=359(x2), r8=58(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 166
LDI r1, 186
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 218
LDI r6, 57
LDI r7, 359
LDI r8, 58
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
