; DESCRIPTION: Draws a black line from (55, 215) to (398, 202).
; PLAN: r0=55(x1), r1=215(y1), r2=398(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 215
LDI r2, 398
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
