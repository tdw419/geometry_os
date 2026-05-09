; DESCRIPTION: Renders a red line between points (225, 112) and (256, 146).
; PLAN: r0=225(x1), r1=112(y1), r2=256(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 112
LDI r2, 256
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
