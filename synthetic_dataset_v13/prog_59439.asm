; DESCRIPTION: Draws a cyan line from (492, 131) to (249, 159).
; PLAN: r0=492(x1), r1=131(y1), r2=249(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 131
LDI r2, 249
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
