; DESCRIPTION: Places a green line segment connecting (492, 5) to (25, 27).
; PLAN: r0=492(x1), r1=5(y1), r2=25(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 5
LDI r2, 25
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
