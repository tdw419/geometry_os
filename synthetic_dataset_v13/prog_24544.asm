; DESCRIPTION: Renders a cyan line between points (331, 203) and (391, 124).
; PLAN: r0=331(x1), r1=203(y1), r2=391(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 203
LDI r2, 391
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
