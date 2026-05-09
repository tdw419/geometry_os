; DESCRIPTION: Renders a red line between points (454, 228) and (17, 187).
; PLAN: r0=454(x1), r1=228(y1), r2=17(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 228
LDI r2, 17
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
