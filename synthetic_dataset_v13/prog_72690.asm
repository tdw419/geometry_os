; DESCRIPTION: Draws a red line from (75, 4) to (401, 120).
; PLAN: r0=75(x1), r1=4(y1), r2=401(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 4
LDI r2, 401
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
