; DESCRIPTION: Draws a black line from (0, 184) to (398, 32).
; PLAN: r0=0(x1), r1=184(y1), r2=398(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 184
LDI r2, 398
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
