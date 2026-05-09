; DESCRIPTION: Renders a magenta line between points (455, 62) and (69, 83).
; PLAN: r0=455(x1), r1=62(y1), r2=69(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 62
LDI r2, 69
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
