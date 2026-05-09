; DESCRIPTION: Places a black line segment connecting (386, 141) to (298, 71).
; PLAN: r0=386(x1), r1=141(y1), r2=298(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 141
LDI r2, 298
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
