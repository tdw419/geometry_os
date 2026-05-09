; DESCRIPTION: Draws a blue line from (467, 239) to (511, 120).
; PLAN: r0=467(x1), r1=239(y1), r2=511(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 239
LDI r2, 511
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
