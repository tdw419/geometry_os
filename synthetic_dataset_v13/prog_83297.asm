; DESCRIPTION: Draws a cyan line from (400, 95) to (95, 194).
; PLAN: r0=400(x1), r1=95(y1), r2=95(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 95
LDI r2, 95
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
