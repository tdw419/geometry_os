; DESCRIPTION: Draws a white line from (353, 228) to (15, 238).
; PLAN: r0=353(x1), r1=228(y1), r2=15(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 228
LDI r2, 15
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
