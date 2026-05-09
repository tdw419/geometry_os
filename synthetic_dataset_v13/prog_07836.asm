; DESCRIPTION: Renders a red line between points (23, 166) and (275, 178).
; PLAN: r0=23(x1), r1=166(y1), r2=275(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 166
LDI r2, 275
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
