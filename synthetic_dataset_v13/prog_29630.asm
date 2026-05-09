; DESCRIPTION: Composite: Sets a single cyan pixel at (23, 147) then Places a green line segment connecting (127, 86) to (328, 229).
; PLAN: r0=23(x), r1=147(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=127(x1), r6=86(y1), r7=328(x2), r8=229(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 147
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 86
LDI r7, 328
LDI r8, 229
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
