; DESCRIPTION: Renders a white line between points (245, 152) and (475, 60).
; PLAN: r0=245(x1), r1=152(y1), r2=475(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 152
LDI r2, 475
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
