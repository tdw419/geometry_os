; DESCRIPTION: Draws a magenta line from (52, 196) to (465, 144).
; PLAN: r0=52(x1), r1=196(y1), r2=465(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 196
LDI r2, 465
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
