; DESCRIPTION: Places a green circle of radius 21 at center (401, 204).
; PLAN: r0=401(x), r1=204(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 204
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
