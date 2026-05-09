; DESCRIPTION: Renders a cyan disk with center (236, 190) and radius 27.
; PLAN: r0=236(x), r1=190(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 190
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
