; DESCRIPTION: Draws a blue line from (61, 214) to (478, 228).
; PLAN: r0=61(x1), r1=214(y1), r2=478(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 214
LDI r2, 478
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
