; DESCRIPTION: Draws a black line from (384, 47) to (23, 170).
; PLAN: r0=384(x1), r1=47(y1), r2=23(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 47
LDI r2, 23
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
