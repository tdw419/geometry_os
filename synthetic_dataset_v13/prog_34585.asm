; DESCRIPTION: Renders a red line between points (501, 129) and (271, 174).
; PLAN: r0=501(x1), r1=129(y1), r2=271(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 129
LDI r2, 271
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
