; DESCRIPTION: Places a white line segment connecting (507, 130) to (221, 174).
; PLAN: r0=507(x1), r1=130(y1), r2=221(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 130
LDI r2, 221
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
