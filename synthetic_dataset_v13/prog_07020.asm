; DESCRIPTION: Renders a red line between points (203, 195) and (502, 12).
; PLAN: r0=203(x1), r1=195(y1), r2=502(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 195
LDI r2, 502
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
