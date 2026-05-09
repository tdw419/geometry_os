; DESCRIPTION: Renders a magenta line between points (33, 42) and (465, 243).
; PLAN: r0=33(x1), r1=42(y1), r2=465(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 42
LDI r2, 465
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
