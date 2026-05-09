; DESCRIPTION: Renders a cyan disk with center (401, 85) and radius 62.
; PLAN: r0=401(x), r1=85(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 85
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
