; DESCRIPTION: Renders a red disk with center (146, 195) and radius 31.
; PLAN: r0=146(x), r1=195(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 195
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
