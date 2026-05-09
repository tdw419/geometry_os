; DESCRIPTION: Draws a blue line from (281, 189) to (264, 210).
; PLAN: r0=281(x1), r1=189(y1), r2=264(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 189
LDI r2, 264
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
