; DESCRIPTION: Draws a yellow line from (52, 196) to (48, 95).
; PLAN: r0=52(x1), r1=196(y1), r2=48(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 196
LDI r2, 48
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
