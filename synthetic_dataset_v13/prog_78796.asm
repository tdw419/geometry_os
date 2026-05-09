; DESCRIPTION: Renders a cyan disk with center (168, 191) and radius 22.
; PLAN: r0=168(x), r1=191(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 191
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
