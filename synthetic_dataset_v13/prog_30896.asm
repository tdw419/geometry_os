; DESCRIPTION: Draws a green line from (249, 202) to (271, 114).
; PLAN: r0=249(x1), r1=202(y1), r2=271(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 202
LDI r2, 271
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
