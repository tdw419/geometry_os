; DESCRIPTION: Draws a green line from (212, 153) to (195, 173).
; PLAN: r0=212(x1), r1=153(y1), r2=195(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 153
LDI r2, 195
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
