; DESCRIPTION: Draws a white line from (420, 7) to (469, 91).
; PLAN: r0=420(x1), r1=7(y1), r2=469(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 7
LDI r2, 469
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
