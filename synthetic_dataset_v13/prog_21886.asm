; DESCRIPTION: Draws a magenta line from (62, 236) to (384, 38).
; PLAN: r0=62(x1), r1=236(y1), r2=384(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 236
LDI r2, 384
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
