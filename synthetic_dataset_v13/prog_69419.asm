; DESCRIPTION: Renders a cyan disk with center (304, 146) and radius 77.
; PLAN: r0=304(x), r1=146(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 146
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
