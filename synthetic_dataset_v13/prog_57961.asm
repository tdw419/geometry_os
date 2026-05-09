; DESCRIPTION: Composite: Places a red dot at position (48, 127) then Places a red line segment connecting (469, 132) to (506, 182).
; PLAN: r0=48(x), r1=127(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=469(x1), r6=132(y1), r7=506(x2), r8=182(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 127
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 469
LDI r6, 132
LDI r7, 506
LDI r8, 182
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
