; DESCRIPTION: Renders a magenta line between points (304, 231) and (260, 33).
; PLAN: r0=304(x1), r1=231(y1), r2=260(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 231
LDI r2, 260
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
