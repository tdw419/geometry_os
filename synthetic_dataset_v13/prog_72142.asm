; DESCRIPTION: Draws a white line from (421, 178) to (253, 177).
; PLAN: r0=421(x1), r1=178(y1), r2=253(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 178
LDI r2, 253
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
