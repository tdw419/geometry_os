; DESCRIPTION: Draws a black line from (298, 56) to (219, 38).
; PLAN: r0=298(x1), r1=56(y1), r2=219(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 56
LDI r2, 219
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
