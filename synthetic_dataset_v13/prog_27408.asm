; DESCRIPTION: Places a cyan circle of radius 27 at center (401, 192).
; PLAN: r0=401(x), r1=192(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 192
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
