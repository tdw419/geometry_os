; DESCRIPTION: Renders a magenta line between points (393, 172) and (330, 236).
; PLAN: r0=393(x1), r1=172(y1), r2=330(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 172
LDI r2, 330
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
