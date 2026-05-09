; DESCRIPTION: Draws a black line from (39, 104) to (510, 231).
; PLAN: r0=39(x1), r1=104(y1), r2=510(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 104
LDI r2, 510
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
