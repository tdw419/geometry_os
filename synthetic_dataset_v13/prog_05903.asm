; DESCRIPTION: Renders a yellow line between points (268, 242) and (489, 177).
; PLAN: r0=268(x1), r1=242(y1), r2=489(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 242
LDI r2, 489
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
