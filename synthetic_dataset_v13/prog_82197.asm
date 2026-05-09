; DESCRIPTION: Draws a red line from (474, 124) to (113, 170).
; PLAN: r0=474(x1), r1=124(y1), r2=113(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 124
LDI r2, 113
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
