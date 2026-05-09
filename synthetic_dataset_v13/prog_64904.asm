; DESCRIPTION: Places a red line segment connecting (398, 11) to (386, 164).
; PLAN: r0=398(x1), r1=11(y1), r2=386(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 11
LDI r2, 386
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
