; DESCRIPTION: Draws a cyan line from (162, 59) to (315, 22).
; PLAN: r0=162(x1), r1=59(y1), r2=315(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 59
LDI r2, 315
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
