; DESCRIPTION: Composite: Sets a single blue pixel at (353, 39) then Draws a blue line from (502, 207) to (282, 11).
; PLAN: r0=353(x), r1=39(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=502(x1), r6=207(y1), r7=282(x2), r8=11(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 39
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 502
LDI r6, 207
LDI r7, 282
LDI r8, 11
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
