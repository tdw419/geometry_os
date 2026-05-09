; DESCRIPTION: Renders a yellow line between points (440, 171) and (242, 172).
; PLAN: r0=440(x1), r1=171(y1), r2=242(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 171
LDI r2, 242
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
