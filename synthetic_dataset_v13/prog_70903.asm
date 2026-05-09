; DESCRIPTION: Renders a cyan disk with center (79, 111) and radius 64.
; PLAN: r0=79(x), r1=111(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 111
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
