; DESCRIPTION: Renders a magenta line between points (82, 154) and (465, 23).
; PLAN: r0=82(x1), r1=154(y1), r2=465(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 154
LDI r2, 465
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
