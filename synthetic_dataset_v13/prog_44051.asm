; DESCRIPTION: Composite: Places a green dot at position (132, 165) then Draws a green line from (185, 237) to (333, 169).
; PLAN: r0=132(x), r1=165(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=185(x1), r6=237(y1), r7=333(x2), r8=169(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 132
LDI r1, 165
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 185
LDI r6, 237
LDI r7, 333
LDI r8, 169
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
