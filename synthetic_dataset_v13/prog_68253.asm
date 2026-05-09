; DESCRIPTION: Renders a red line between points (367, 223) and (445, 2).
; PLAN: r0=367(x1), r1=223(y1), r2=445(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 223
LDI r2, 445
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
