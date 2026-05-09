; DESCRIPTION: Draws a yellow line from (213, 202) to (487, 137).
; PLAN: r0=213(x1), r1=202(y1), r2=487(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 202
LDI r2, 487
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
