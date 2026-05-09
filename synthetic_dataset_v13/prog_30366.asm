; DESCRIPTION: Places a black line segment connecting (398, 56) to (146, 186).
; PLAN: r0=398(x1), r1=56(y1), r2=146(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 56
LDI r2, 146
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
