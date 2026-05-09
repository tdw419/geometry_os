; DESCRIPTION: Draws a yellow line from (58, 196) to (60, 192).
; PLAN: r0=58(x1), r1=196(y1), r2=60(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 196
LDI r2, 60
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
