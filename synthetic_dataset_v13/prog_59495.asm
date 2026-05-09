; DESCRIPTION: Draws a black line from (46, 209) to (335, 48).
; PLAN: r0=46(x1), r1=209(y1), r2=335(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 209
LDI r2, 335
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
