; DESCRIPTION: Renders a green line between points (460, 119) and (431, 215).
; PLAN: r0=460(x1), r1=119(y1), r2=431(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 119
LDI r2, 431
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
