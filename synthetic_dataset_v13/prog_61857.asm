; DESCRIPTION: Places a cyan line segment connecting (460, 198) to (388, 15).
; PLAN: r0=460(x1), r1=198(y1), r2=388(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 198
LDI r2, 388
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
