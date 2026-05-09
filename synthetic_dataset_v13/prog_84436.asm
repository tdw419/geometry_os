; DESCRIPTION: Draws a cyan line from (478, 59) to (91, 203).
; PLAN: r0=478(x1), r1=59(y1), r2=91(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 59
LDI r2, 91
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
