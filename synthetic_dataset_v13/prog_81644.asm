; DESCRIPTION: Draws a cyan line from (35, 3) to (153, 138).
; PLAN: r0=35(x1), r1=3(y1), r2=153(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 3
LDI r2, 153
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
