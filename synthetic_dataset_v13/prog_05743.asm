; DESCRIPTION: Draws a cyan line from (131, 132) to (189, 251).
; PLAN: r0=131(x1), r1=132(y1), r2=189(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 132
LDI r2, 189
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
