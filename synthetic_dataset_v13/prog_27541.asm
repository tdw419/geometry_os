; DESCRIPTION: Draws a green line from (374, 58) to (471, 154).
; PLAN: r0=374(x1), r1=58(y1), r2=471(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 58
LDI r2, 471
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
