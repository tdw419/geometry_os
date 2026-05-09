; DESCRIPTION: Composite: Places a cyan dot at position (185, 33) then Renders a magenta line between points (425, 162) and (245, 144).
; PLAN: r0=185(x), r1=33(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=425(x1), r6=162(y1), r7=245(x2), r8=144(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 185
LDI r1, 33
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 425
LDI r6, 162
LDI r7, 245
LDI r8, 144
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
