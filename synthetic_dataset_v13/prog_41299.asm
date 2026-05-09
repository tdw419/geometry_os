; DESCRIPTION: Draws a black line from (295, 179) to (405, 84).
; PLAN: r0=295(x1), r1=179(y1), r2=405(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 179
LDI r2, 405
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
