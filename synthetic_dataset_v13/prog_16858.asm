; DESCRIPTION: Draws a red line from (135, 82) to (284, 10).
; PLAN: r0=135(x1), r1=82(y1), r2=284(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 82
LDI r2, 284
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
