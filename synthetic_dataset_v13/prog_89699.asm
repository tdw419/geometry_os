; DESCRIPTION: Draws a green line from (178, 13) to (303, 77).
; PLAN: r0=178(x1), r1=13(y1), r2=303(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 13
LDI r2, 303
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
