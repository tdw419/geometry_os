; DESCRIPTION: Draws a cyan line from (94, 251) to (332, 225).
; PLAN: r0=94(x1), r1=251(y1), r2=332(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 251
LDI r2, 332
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
