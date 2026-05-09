; DESCRIPTION: Draws a cyan line from (293, 65) to (102, 162).
; PLAN: r0=293(x1), r1=65(y1), r2=102(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 65
LDI r2, 102
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
