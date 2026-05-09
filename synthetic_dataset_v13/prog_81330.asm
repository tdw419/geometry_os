; DESCRIPTION: Composite: Renders a red line between points (474, 48) and (321, 235) then Places a green dot at position (413, 215).
; PLAN: r0=474(x1), r1=48(y1), r2=321(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=215(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 474
LDI r1, 48
LDI r2, 321
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 215
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
