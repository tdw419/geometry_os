; DESCRIPTION: Renders a red line between points (372, 168) and (417, 173).
; PLAN: r0=372(x1), r1=168(y1), r2=417(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 168
LDI r2, 417
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
