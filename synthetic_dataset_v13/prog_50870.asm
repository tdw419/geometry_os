; DESCRIPTION: Composite: Places a cyan line segment connecting (408, 100) to (241, 173) then Places a green dot at position (68, 109).
; PLAN: r0=408(x1), r1=100(y1), r2=241(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=109(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 408
LDI r1, 100
LDI r2, 241
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 109
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
