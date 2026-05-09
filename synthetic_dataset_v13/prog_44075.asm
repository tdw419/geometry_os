; DESCRIPTION: Renders a magenta line between points (362, 154) and (406, 235).
; PLAN: r0=362(x1), r1=154(y1), r2=406(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 154
LDI r2, 406
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
