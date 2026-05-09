; DESCRIPTION: Composite: Sets a single cyan pixel at (350, 192) then Renders a blue line between points (203, 135) and (260, 72).
; PLAN: r0=350(x), r1=192(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=203(x1), r6=135(y1), r7=260(x2), r8=72(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 192
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 203
LDI r6, 135
LDI r7, 260
LDI r8, 72
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
