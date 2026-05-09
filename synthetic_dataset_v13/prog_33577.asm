; DESCRIPTION: Renders a blue line between points (86, 80) and (228, 113).
; PLAN: r0=86(x1), r1=80(y1), r2=228(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 80
LDI r2, 228
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
