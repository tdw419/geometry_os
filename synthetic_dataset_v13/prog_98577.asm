; DESCRIPTION: Places a black line segment connecting (57, 43) to (398, 190).
; PLAN: r0=57(x1), r1=43(y1), r2=398(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 43
LDI r2, 398
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
