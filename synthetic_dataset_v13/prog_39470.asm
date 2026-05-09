; DESCRIPTION: Renders a black line between points (465, 174) and (404, 178).
; PLAN: r0=465(x1), r1=174(y1), r2=404(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 174
LDI r2, 404
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
