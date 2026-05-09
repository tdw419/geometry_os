; DESCRIPTION: Draws a black line from (67, 4) to (23, 242).
; PLAN: r0=67(x1), r1=4(y1), r2=23(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 4
LDI r2, 23
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
