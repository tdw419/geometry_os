; DESCRIPTION: Composite: Places a green dot at position (183, 92) then Renders a cyan line between points (22, 136) and (113, 21).
; PLAN: r0=183(x), r1=92(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=22(x1), r6=136(y1), r7=113(x2), r8=21(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 183
LDI r1, 92
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 22
LDI r6, 136
LDI r7, 113
LDI r8, 21
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
