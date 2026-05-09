; DESCRIPTION: Places a green line segment connecting (386, 43) to (391, 150).
; PLAN: r0=386(x1), r1=43(y1), r2=391(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 43
LDI r2, 391
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
