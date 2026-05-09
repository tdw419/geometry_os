; DESCRIPTION: Draws a magenta line from (269, 57) to (459, 27).
; PLAN: r0=269(x1), r1=57(y1), r2=459(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 57
LDI r2, 459
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
