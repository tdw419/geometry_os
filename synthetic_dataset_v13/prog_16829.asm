; DESCRIPTION: Renders a blue line between points (210, 180) and (365, 127).
; PLAN: r0=210(x1), r1=180(y1), r2=365(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 180
LDI r2, 365
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
