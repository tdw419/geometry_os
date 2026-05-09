; DESCRIPTION: Draws a white line from (445, 225) to (499, 252).
; PLAN: r0=445(x1), r1=225(y1), r2=499(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 225
LDI r2, 499
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
