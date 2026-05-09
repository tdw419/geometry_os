; DESCRIPTION: Composite: Draws a blue line from (272, 78) to (49, 229) then Places a green dot at position (284, 238).
; PLAN: r0=272(x1), r1=78(y1), r2=49(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=238(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 78
LDI r2, 49
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 238
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
