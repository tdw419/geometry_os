; DESCRIPTION: Draws a orange line from (168, 36) to (131, 219).
; PLAN: r0=168(x1), r1=36(y1), r2=131(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 36
LDI r2, 131
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
