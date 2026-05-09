; DESCRIPTION: Renders a red line between points (217, 191) and (398, 161).
; PLAN: r0=217(x1), r1=191(y1), r2=398(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 191
LDI r2, 398
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
