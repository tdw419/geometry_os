; DESCRIPTION: Draws a white line from (493, 206) to (306, 91).
; PLAN: r0=493(x1), r1=206(y1), r2=306(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 206
LDI r2, 306
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
