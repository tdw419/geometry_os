; DESCRIPTION: Renders a yellow line between points (371, 22) and (298, 32).
; PLAN: r0=371(x1), r1=22(y1), r2=298(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 22
LDI r2, 298
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
