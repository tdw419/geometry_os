; DESCRIPTION: Draws a orange line from (415, 138) to (298, 246).
; PLAN: r0=415(x1), r1=138(y1), r2=298(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 138
LDI r2, 298
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
