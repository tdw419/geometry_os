; DESCRIPTION: Renders a cyan disk with center (202, 221) and radius 31.
; PLAN: r0=202(x), r1=221(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 221
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
