; DESCRIPTION: Renders a white line between points (489, 173) and (245, 141).
; PLAN: r0=489(x1), r1=173(y1), r2=245(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 173
LDI r2, 245
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
