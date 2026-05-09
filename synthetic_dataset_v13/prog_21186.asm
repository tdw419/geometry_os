; DESCRIPTION: Places a yellow line segment connecting (47, 215) to (460, 160).
; PLAN: r0=47(x1), r1=215(y1), r2=460(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 215
LDI r2, 460
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
