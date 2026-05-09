; DESCRIPTION: Draws a cyan line from (470, 153) to (205, 23).
; PLAN: r0=470(x1), r1=153(y1), r2=205(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 153
LDI r2, 205
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
