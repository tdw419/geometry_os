; DESCRIPTION: Draws a white line from (410, 95) to (71, 90).
; PLAN: r0=410(x1), r1=95(y1), r2=71(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 95
LDI r2, 71
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
