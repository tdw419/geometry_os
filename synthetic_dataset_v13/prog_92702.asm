; DESCRIPTION: Draws a red line from (420, 164) to (434, 24).
; PLAN: r0=420(x1), r1=164(y1), r2=434(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 164
LDI r2, 434
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
