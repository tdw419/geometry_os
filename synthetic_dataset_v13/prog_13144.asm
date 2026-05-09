; DESCRIPTION: Draws a green line from (352, 73) to (412, 144).
; PLAN: r0=352(x1), r1=73(y1), r2=412(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 73
LDI r2, 412
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
