; DESCRIPTION: Renders a red line between points (127, 70) and (135, 177).
; PLAN: r0=127(x1), r1=70(y1), r2=135(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 70
LDI r2, 135
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
