; DESCRIPTION: Draws a cyan line from (162, 214) to (170, 4).
; PLAN: r0=162(x1), r1=214(y1), r2=170(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 214
LDI r2, 170
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
