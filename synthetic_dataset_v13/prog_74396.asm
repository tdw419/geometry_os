; DESCRIPTION: Renders a green line between points (274, 242) and (356, 164).
; PLAN: r0=274(x1), r1=242(y1), r2=356(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 242
LDI r2, 356
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
