; DESCRIPTION: Renders a red disk with center (146, 82) and radius 22.
; PLAN: r0=146(x), r1=82(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 82
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
