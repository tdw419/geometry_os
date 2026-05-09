; DESCRIPTION: Draws a black line from (35, 57) to (403, 113).
; PLAN: r0=35(x1), r1=57(y1), r2=403(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 57
LDI r2, 403
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
