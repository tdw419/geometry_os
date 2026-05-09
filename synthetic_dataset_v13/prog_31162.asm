; DESCRIPTION: Renders a cyan disk with center (410, 117) and radius 66.
; PLAN: r0=410(x), r1=117(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 117
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
