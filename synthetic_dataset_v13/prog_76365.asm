; DESCRIPTION: Draws a red line from (346, 176) to (108, 184).
; PLAN: r0=346(x1), r1=176(y1), r2=108(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 176
LDI r2, 108
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
