; DESCRIPTION: Draws a cyan line from (403, 140) to (14, 2).
; PLAN: r0=403(x1), r1=140(y1), r2=14(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 140
LDI r2, 14
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
