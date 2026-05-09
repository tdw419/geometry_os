; DESCRIPTION: Places a green line segment connecting (298, 72) to (386, 34).
; PLAN: r0=298(x1), r1=72(y1), r2=386(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 72
LDI r2, 386
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
