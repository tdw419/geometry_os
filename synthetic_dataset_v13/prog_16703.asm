; DESCRIPTION: Renders a magenta line between points (455, 134) and (479, 206).
; PLAN: r0=455(x1), r1=134(y1), r2=479(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 134
LDI r2, 479
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
