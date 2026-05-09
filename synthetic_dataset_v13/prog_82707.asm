; DESCRIPTION: Places a yellow line segment connecting (487, 43) to (213, 56).
; PLAN: r0=487(x1), r1=43(y1), r2=213(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 43
LDI r2, 213
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
