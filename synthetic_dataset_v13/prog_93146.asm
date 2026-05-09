; DESCRIPTION: Composite: Sets a single purple pixel at (23, 18) then Renders a purple line between points (209, 224) and (359, 59).
; PLAN: r0=23(x), r1=18(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=209(x1), r6=224(y1), r7=359(x2), r8=59(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 18
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 209
LDI r6, 224
LDI r7, 359
LDI r8, 59
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
