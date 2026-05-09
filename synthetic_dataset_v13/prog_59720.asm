; DESCRIPTION: Renders a blue line between points (481, 171) and (0, 166).
; PLAN: r0=481(x1), r1=171(y1), r2=0(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 171
LDI r2, 0
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
