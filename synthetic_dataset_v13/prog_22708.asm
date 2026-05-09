; DESCRIPTION: Renders a yellow line between points (341, 177) and (215, 242).
; PLAN: r0=341(x1), r1=177(y1), r2=215(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 177
LDI r2, 215
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
