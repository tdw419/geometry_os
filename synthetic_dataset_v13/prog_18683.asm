; DESCRIPTION: Draws a cyan line from (3, 230) to (9, 110).
; PLAN: r0=3(x1), r1=230(y1), r2=9(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 230
LDI r2, 9
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
