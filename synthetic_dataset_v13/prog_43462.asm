; DESCRIPTION: Composite: Sets a single purple pixel at (453, 112) then Draws a magenta line from (29, 205) to (224, 205).
; PLAN: r0=453(x), r1=112(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=29(x1), r6=205(y1), r7=224(x2), r8=205(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 112
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 29
LDI r6, 205
LDI r7, 224
LDI r8, 205
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
