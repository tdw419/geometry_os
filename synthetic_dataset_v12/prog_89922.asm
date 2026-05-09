; DESCRIPTION: Composite: Sets a single green pixel at (92, 218) then Places a magenta line segment connecting (212, 47) to (404, 16).
; PLAN: r0=92(x), r1=218(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=212(x1), r6=47(y1), r7=404(x2), r8=16(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 218
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 212
LDI r6, 47
LDI r7, 404
LDI r8, 16
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
