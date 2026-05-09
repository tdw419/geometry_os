; DESCRIPTION: Renders a green line between points (79, 6) and (106, 113).
; PLAN: r0=79(x1), r1=6(y1), r2=106(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 6
LDI r2, 106
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
