; DESCRIPTION: Renders a cyan line between points (491, 203) and (55, 132).
; PLAN: r0=491(x1), r1=203(y1), r2=55(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 203
LDI r2, 55
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
