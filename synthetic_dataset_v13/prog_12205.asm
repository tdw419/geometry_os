; DESCRIPTION: Composite: Places a cyan dot at position (147, 227) then Draws a magenta line from (19, 186) to (474, 177).
; PLAN: r0=147(x), r1=227(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=19(x1), r6=186(y1), r7=474(x2), r8=177(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 227
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 19
LDI r6, 186
LDI r7, 474
LDI r8, 177
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
