; DESCRIPTION: Places a cyan line segment connecting (386, 91) to (288, 120).
; PLAN: r0=386(x1), r1=91(y1), r2=288(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 91
LDI r2, 288
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
