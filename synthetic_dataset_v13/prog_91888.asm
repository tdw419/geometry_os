; DESCRIPTION: Renders a white line between points (165, 68) and (171, 236).
; PLAN: r0=165(x1), r1=68(y1), r2=171(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 68
LDI r2, 171
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
