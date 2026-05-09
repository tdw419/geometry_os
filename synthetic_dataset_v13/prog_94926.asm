; DESCRIPTION: Renders a white line between points (415, 249) and (230, 234).
; PLAN: r0=415(x1), r1=249(y1), r2=230(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 249
LDI r2, 230
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
