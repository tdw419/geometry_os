; DESCRIPTION: Draws a blue line from (434, 240) to (503, 5).
; PLAN: r0=434(x1), r1=240(y1), r2=503(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 240
LDI r2, 503
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
