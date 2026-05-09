; DESCRIPTION: Draws a black line from (414, 21) to (228, 187).
; PLAN: r0=414(x1), r1=21(y1), r2=228(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 21
LDI r2, 228
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
