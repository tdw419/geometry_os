; DESCRIPTION: Draws a cyan line from (110, 160) to (43, 103).
; PLAN: r0=110(x1), r1=160(y1), r2=43(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 160
LDI r2, 43
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
