; DESCRIPTION: Composite: Places a yellow dot at position (58, 68) then Draws a blue line from (280, 190) to (287, 237).
; PLAN: r0=58(x), r1=68(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=280(x1), r6=190(y1), r7=287(x2), r8=237(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 68
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 280
LDI r6, 190
LDI r7, 287
LDI r8, 237
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
