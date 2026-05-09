; DESCRIPTION: Renders a red line between points (59, 203) and (275, 209).
; PLAN: r0=59(x1), r1=203(y1), r2=275(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 203
LDI r2, 275
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
