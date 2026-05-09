; DESCRIPTION: Renders a white line between points (346, 33) and (200, 177).
; PLAN: r0=346(x1), r1=33(y1), r2=200(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 33
LDI r2, 200
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
