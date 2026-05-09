; DESCRIPTION: Renders a red disk with center (126, 186) and radius 24.
; PLAN: r0=126(x), r1=186(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 186
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
