; DESCRIPTION: Renders a blue line between points (510, 8) and (334, 213).
; PLAN: r0=510(x1), r1=8(y1), r2=334(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 8
LDI r2, 334
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
