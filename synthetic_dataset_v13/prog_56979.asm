; DESCRIPTION: Renders a blue line between points (178, 215) and (340, 150).
; PLAN: r0=178(x1), r1=215(y1), r2=340(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 215
LDI r2, 340
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
