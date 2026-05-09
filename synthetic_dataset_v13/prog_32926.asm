; DESCRIPTION: Draws a cyan line from (300, 124) to (407, 15).
; PLAN: r0=300(x1), r1=124(y1), r2=407(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 124
LDI r2, 407
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
