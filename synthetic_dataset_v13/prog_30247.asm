; DESCRIPTION: Draws a red line from (353, 228) to (307, 21).
; PLAN: r0=353(x1), r1=228(y1), r2=307(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 228
LDI r2, 307
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
