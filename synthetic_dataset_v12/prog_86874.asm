; DESCRIPTION: Draws a red line from (55, 239) to (410, 189).
; PLAN: r0=55(x1), r1=239(y1), r2=410(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 239
LDI r2, 410
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
