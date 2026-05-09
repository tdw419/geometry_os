; DESCRIPTION: Draws a red line from (415, 191) to (268, 33).
; PLAN: r0=415(x1), r1=191(y1), r2=268(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 191
LDI r2, 268
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
