; DESCRIPTION: Draws a red line from (403, 180) to (307, 20).
; PLAN: r0=403(x1), r1=180(y1), r2=307(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 180
LDI r2, 307
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
