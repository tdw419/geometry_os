; DESCRIPTION: Composite: Renders a purple box of size 19x111 starting at (145, 139) then Renders a red line between points (171, 96) and (282, 112).
; PLAN: r0=145(x), r1=139(y), r2=19(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x1), r6=96(y1), r7=282(x2), r8=112(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 139
LDI r2, 19
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 96
LDI r7, 282
LDI r8, 112
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
