; DESCRIPTION: Composite: Places a magenta dot at position (327, 136) then Renders a red line between points (328, 76) and (442, 249).
; PLAN: r0=327(x), r1=136(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=328(x1), r6=76(y1), r7=442(x2), r8=249(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 327
LDI r1, 136
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 328
LDI r6, 76
LDI r7, 442
LDI r8, 249
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
