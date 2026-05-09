; DESCRIPTION: Renders a red line between points (239, 141) and (338, 70).
; PLAN: r0=239(x1), r1=141(y1), r2=338(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 141
LDI r2, 338
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
