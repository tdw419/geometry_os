; DESCRIPTION: Draws a black line from (140, 116) to (228, 208).
; PLAN: r0=140(x1), r1=116(y1), r2=228(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 116
LDI r2, 228
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
