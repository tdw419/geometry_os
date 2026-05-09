; DESCRIPTION: Draws a green line from (225, 192) to (226, 192).
; PLAN: r0=225(x1), r1=192(y1), r2=226(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 192
LDI r2, 226
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
