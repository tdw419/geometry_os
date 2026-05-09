; DESCRIPTION: Places a cyan circle of radius 58 at center (401, 178).
; PLAN: r0=401(x), r1=178(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 178
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
