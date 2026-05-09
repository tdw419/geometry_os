; DESCRIPTION: Draws a black line from (494, 248) to (295, 160).
; PLAN: r0=494(x1), r1=248(y1), r2=295(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 248
LDI r2, 295
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
