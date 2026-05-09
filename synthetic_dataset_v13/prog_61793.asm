; DESCRIPTION: Draws a yellow line from (130, 208) to (352, 196).
; PLAN: r0=130(x1), r1=208(y1), r2=352(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 208
LDI r2, 352
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
