; DESCRIPTION: Renders a blue line between points (213, 50) and (510, 168).
; PLAN: r0=213(x1), r1=50(y1), r2=510(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 50
LDI r2, 510
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
