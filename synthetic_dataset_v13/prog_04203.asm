; DESCRIPTION: Renders a cyan disk with center (166, 124) and radius 50.
; PLAN: r0=166(x), r1=124(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 124
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
