; DESCRIPTION: Draws a black line from (410, 45) to (237, 96).
; PLAN: r0=410(x1), r1=45(y1), r2=237(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 45
LDI r2, 237
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
