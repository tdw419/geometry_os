; DESCRIPTION: Draws a yellow line from (254, 74) to (358, 91).
; PLAN: r0=254(x1), r1=74(y1), r2=358(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 74
LDI r2, 358
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
