; DESCRIPTION: Draws a black line from (305, 250) to (410, 35).
; PLAN: r0=305(x1), r1=250(y1), r2=410(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 250
LDI r2, 410
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
