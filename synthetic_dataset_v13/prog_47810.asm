; DESCRIPTION: Draws a green line from (306, 49) to (487, 174).
; PLAN: r0=306(x1), r1=49(y1), r2=487(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 49
LDI r2, 487
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
