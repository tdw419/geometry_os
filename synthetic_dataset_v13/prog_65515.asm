; DESCRIPTION: Renders a red line between points (177, 165) and (228, 242).
; PLAN: r0=177(x1), r1=165(y1), r2=228(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 165
LDI r2, 228
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
