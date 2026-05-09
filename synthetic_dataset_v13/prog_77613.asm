; DESCRIPTION: Renders a yellow line between points (116, 215) and (418, 21).
; PLAN: r0=116(x1), r1=215(y1), r2=418(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 215
LDI r2, 418
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
