; DESCRIPTION: Draws a yellow line from (241, 48) to (173, 127).
; PLAN: r0=241(x1), r1=48(y1), r2=173(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 48
LDI r2, 173
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
