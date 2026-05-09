; DESCRIPTION: Places a green line segment connecting (434, 35) to (398, 243).
; PLAN: r0=434(x1), r1=35(y1), r2=398(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 35
LDI r2, 398
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
