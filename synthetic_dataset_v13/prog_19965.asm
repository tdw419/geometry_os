; DESCRIPTION: Draws a black line from (403, 39) to (187, 168).
; PLAN: r0=403(x1), r1=39(y1), r2=187(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 39
LDI r2, 187
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
