; DESCRIPTION: Places a black line segment connecting (298, 38) to (352, 5).
; PLAN: r0=298(x1), r1=38(y1), r2=352(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 38
LDI r2, 352
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
