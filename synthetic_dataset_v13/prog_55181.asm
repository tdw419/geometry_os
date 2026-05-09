; DESCRIPTION: Renders a magenta line between points (39, 135) and (510, 31).
; PLAN: r0=39(x1), r1=135(y1), r2=510(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 135
LDI r2, 510
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
