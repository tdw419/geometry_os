; DESCRIPTION: Places a yellow line segment connecting (160, 71) to (340, 195).
; PLAN: r0=160(x1), r1=71(y1), r2=340(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 71
LDI r2, 340
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
