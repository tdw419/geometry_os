; DESCRIPTION: Renders a blue line between points (387, 215) and (398, 135).
; PLAN: r0=387(x1), r1=215(y1), r2=398(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 215
LDI r2, 398
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
