; DESCRIPTION: Draws a blue line from (291, 32) to (434, 45).
; PLAN: r0=291(x1), r1=32(y1), r2=434(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 32
LDI r2, 434
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
