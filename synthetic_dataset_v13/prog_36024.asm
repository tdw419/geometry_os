; DESCRIPTION: Composite: Sets a single yellow pixel at (282, 134) then Draws a blue line from (420, 128) to (48, 196).
; PLAN: r0=282(x), r1=134(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=420(x1), r6=128(y1), r7=48(x2), r8=196(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 282
LDI r1, 134
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 420
LDI r6, 128
LDI r7, 48
LDI r8, 196
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
