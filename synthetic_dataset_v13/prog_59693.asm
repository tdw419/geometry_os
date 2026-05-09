; DESCRIPTION: Draws a yellow line from (342, 73) to (340, 63).
; PLAN: r0=342(x1), r1=73(y1), r2=340(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 73
LDI r2, 340
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
