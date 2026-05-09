; DESCRIPTION: Renders a red line between points (349, 215) and (267, 167).
; PLAN: r0=349(x1), r1=215(y1), r2=267(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 215
LDI r2, 267
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
