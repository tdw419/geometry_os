; DESCRIPTION: Composite: Sets a single cyan pixel at (373, 23) then Renders a magenta line between points (407, 63) and (225, 134).
; PLAN: r0=373(x), r1=23(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=407(x1), r6=63(y1), r7=225(x2), r8=134(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 23
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 407
LDI r6, 63
LDI r7, 225
LDI r8, 134
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
