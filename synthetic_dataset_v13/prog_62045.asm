; DESCRIPTION: Draws a purple line from (48, 223) to (247, 210).
; PLAN: r0=48(x1), r1=223(y1), r2=247(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 223
LDI r2, 247
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
