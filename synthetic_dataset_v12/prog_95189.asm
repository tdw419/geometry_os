; DESCRIPTION: Draws a orange line from (180, 64) to (494, 126).
; PLAN: r0=180(x1), r1=64(y1), r2=494(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 64
LDI r2, 494
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
