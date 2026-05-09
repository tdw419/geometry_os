; DESCRIPTION: Draws a white line from (265, 46) to (48, 203).
; PLAN: r0=265(x1), r1=46(y1), r2=48(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 46
LDI r2, 48
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
