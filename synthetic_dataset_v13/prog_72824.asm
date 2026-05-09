; DESCRIPTION: Draws a cyan line from (470, 35) to (54, 212).
; PLAN: r0=470(x1), r1=35(y1), r2=54(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 35
LDI r2, 54
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
