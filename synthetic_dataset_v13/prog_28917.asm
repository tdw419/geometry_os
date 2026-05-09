; DESCRIPTION: Draws a red line from (157, 67) to (308, 254).
; PLAN: r0=157(x1), r1=67(y1), r2=308(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 67
LDI r2, 308
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
