; DESCRIPTION: Draws a green line from (74, 63) to (104, 173).
; PLAN: r0=74(x1), r1=63(y1), r2=104(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 63
LDI r2, 104
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
