; DESCRIPTION: Renders a yellow line between points (60, 124) and (171, 174).
; PLAN: r0=60(x1), r1=124(y1), r2=171(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 124
LDI r2, 171
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
