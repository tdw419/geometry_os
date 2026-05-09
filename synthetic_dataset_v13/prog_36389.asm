; DESCRIPTION: Renders a red line between points (186, 221) and (346, 46).
; PLAN: r0=186(x1), r1=221(y1), r2=346(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 221
LDI r2, 346
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
