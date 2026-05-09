; DESCRIPTION: Draws a green line from (438, 193) to (124, 242).
; PLAN: r0=438(x1), r1=193(y1), r2=124(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 193
LDI r2, 124
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
