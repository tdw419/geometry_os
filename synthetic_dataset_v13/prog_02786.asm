; DESCRIPTION: Renders a cyan disk with center (246, 174) and radius 79.
; PLAN: r0=246(x), r1=174(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 174
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
