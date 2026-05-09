; DESCRIPTION: Renders a red line between points (281, 97) and (340, 186).
; PLAN: r0=281(x1), r1=97(y1), r2=340(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 97
LDI r2, 340
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
