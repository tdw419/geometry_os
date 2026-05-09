; DESCRIPTION: Draws a blue line from (400, 173) to (265, 128).
; PLAN: r0=400(x1), r1=173(y1), r2=265(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 173
LDI r2, 265
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
