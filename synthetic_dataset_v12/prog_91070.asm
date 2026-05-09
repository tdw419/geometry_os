; DESCRIPTION: Renders a cyan disk with center (187, 58) and radius 35.
; PLAN: r0=187(x), r1=58(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 58
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
