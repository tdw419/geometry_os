; DESCRIPTION: Draws a cyan line from (508, 198) to (402, 58).
; PLAN: r0=508(x1), r1=198(y1), r2=402(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 198
LDI r2, 402
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
