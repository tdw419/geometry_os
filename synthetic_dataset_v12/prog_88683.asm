; DESCRIPTION: Renders a blue line between points (465, 48) and (492, 171).
; PLAN: r0=465(x1), r1=48(y1), r2=492(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 48
LDI r2, 492
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
