; DESCRIPTION: Places a black line segment connecting (367, 73) to (303, 173).
; PLAN: r0=367(x1), r1=73(y1), r2=303(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 73
LDI r2, 303
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
