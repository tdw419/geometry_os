; DESCRIPTION: Renders a blue line between points (90, 29) and (215, 125).
; PLAN: r0=90(x1), r1=29(y1), r2=215(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 29
LDI r2, 215
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
