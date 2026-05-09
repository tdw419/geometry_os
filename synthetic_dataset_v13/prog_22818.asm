; DESCRIPTION: Renders a yellow line between points (72, 175) and (307, 173).
; PLAN: r0=72(x1), r1=175(y1), r2=307(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 175
LDI r2, 307
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
