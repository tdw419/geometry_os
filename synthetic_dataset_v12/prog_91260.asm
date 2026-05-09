; DESCRIPTION: Renders a magenta line between points (262, 255) and (465, 194).
; PLAN: r0=262(x1), r1=255(y1), r2=465(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 255
LDI r2, 465
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
