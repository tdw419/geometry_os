; DESCRIPTION: Renders a white line between points (499, 11) and (245, 5).
; PLAN: r0=499(x1), r1=11(y1), r2=245(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 11
LDI r2, 245
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
