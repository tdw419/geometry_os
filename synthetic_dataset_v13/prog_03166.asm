; DESCRIPTION: Draws a cyan line from (17, 181) to (225, 212).
; PLAN: r0=17(x1), r1=181(y1), r2=225(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 181
LDI r2, 225
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
