; DESCRIPTION: Renders a yellow line between points (329, 214) and (173, 87).
; PLAN: r0=329(x1), r1=214(y1), r2=173(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 214
LDI r2, 173
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
