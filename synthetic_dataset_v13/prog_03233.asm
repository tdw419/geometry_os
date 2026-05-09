; DESCRIPTION: Draws a magenta line from (494, 186) to (459, 210).
; PLAN: r0=494(x1), r1=186(y1), r2=459(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 186
LDI r2, 459
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
