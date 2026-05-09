; DESCRIPTION: Draws a magenta line from (502, 6) to (34, 244).
; PLAN: r0=502(x1), r1=6(y1), r2=34(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 6
LDI r2, 34
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
