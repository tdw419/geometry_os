; DESCRIPTION: Renders a red line between points (487, 233) and (424, 113).
; PLAN: r0=487(x1), r1=233(y1), r2=424(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 233
LDI r2, 424
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
