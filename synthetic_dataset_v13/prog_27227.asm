; DESCRIPTION: Renders a cyan disk with center (401, 186) and radius 56.
; PLAN: r0=401(x), r1=186(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 186
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
