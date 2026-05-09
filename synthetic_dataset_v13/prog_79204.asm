; DESCRIPTION: Draws a green line from (508, 16) to (208, 127).
; PLAN: r0=508(x1), r1=16(y1), r2=208(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 16
LDI r2, 208
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
