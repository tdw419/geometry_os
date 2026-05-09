; DESCRIPTION: Places a yellow line segment connecting (298, 17) to (198, 32).
; PLAN: r0=298(x1), r1=17(y1), r2=198(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 17
LDI r2, 198
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
