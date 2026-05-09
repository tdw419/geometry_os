; DESCRIPTION: Renders a blue line between points (215, 172) and (487, 67).
; PLAN: r0=215(x1), r1=172(y1), r2=487(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 172
LDI r2, 487
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
