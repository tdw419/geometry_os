; DESCRIPTION: Renders a blue line between points (256, 213) and (367, 13).
; PLAN: r0=256(x1), r1=213(y1), r2=367(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 213
LDI r2, 367
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
