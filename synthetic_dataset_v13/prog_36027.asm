; DESCRIPTION: Composite: Places a white dot at position (420, 184) then Places a red line segment connecting (411, 235) to (151, 8).
; PLAN: r0=420(x), r1=184(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=411(x1), r6=235(y1), r7=151(x2), r8=8(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 184
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 411
LDI r6, 235
LDI r7, 151
LDI r8, 8
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
