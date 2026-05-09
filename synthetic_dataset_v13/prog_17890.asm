; DESCRIPTION: Composite: Places a orange dot at position (180, 59) then Renders a yellow line between points (280, 162) and (216, 111).
; PLAN: r0=180(x), r1=59(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=280(x1), r6=162(y1), r7=216(x2), r8=111(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 59
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 280
LDI r6, 162
LDI r7, 216
LDI r8, 111
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
