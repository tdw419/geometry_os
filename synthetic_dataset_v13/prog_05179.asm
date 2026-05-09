; DESCRIPTION: Draws a red line from (167, 41) to (387, 204).
; PLAN: r0=167(x1), r1=41(y1), r2=387(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 41
LDI r2, 387
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
