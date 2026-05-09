; DESCRIPTION: Renders a cyan disk with center (276, 109) and radius 57.
; PLAN: r0=276(x), r1=109(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 109
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
