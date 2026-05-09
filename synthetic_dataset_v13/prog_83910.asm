; DESCRIPTION: Draws a cyan line from (370, 138) to (189, 77).
; PLAN: r0=370(x1), r1=138(y1), r2=189(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 138
LDI r2, 189
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
