; DESCRIPTION: Renders a magenta line between points (308, 242) and (384, 48).
; PLAN: r0=308(x1), r1=242(y1), r2=384(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 242
LDI r2, 384
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
