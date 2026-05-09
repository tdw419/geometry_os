; DESCRIPTION: Draws a blue line from (502, 241) to (474, 86).
; PLAN: r0=502(x1), r1=241(y1), r2=474(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 241
LDI r2, 474
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
