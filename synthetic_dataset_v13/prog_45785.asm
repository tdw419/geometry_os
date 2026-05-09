; DESCRIPTION: Renders a red line between points (409, 126) and (123, 174).
; PLAN: r0=409(x1), r1=126(y1), r2=123(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 126
LDI r2, 123
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
