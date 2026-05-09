; DESCRIPTION: Draws a cyan line from (391, 169) to (109, 221).
; PLAN: r0=391(x1), r1=169(y1), r2=109(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 169
LDI r2, 109
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
