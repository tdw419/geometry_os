; DESCRIPTION: Draws a yellow line from (48, 163) to (228, 62).
; PLAN: r0=48(x1), r1=163(y1), r2=228(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 163
LDI r2, 228
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
