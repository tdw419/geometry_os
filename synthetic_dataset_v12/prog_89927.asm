; DESCRIPTION: Places a white line segment connecting (386, 27) to (383, 17).
; PLAN: r0=386(x1), r1=27(y1), r2=383(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 27
LDI r2, 383
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
