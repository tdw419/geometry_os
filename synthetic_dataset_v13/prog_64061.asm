; DESCRIPTION: Places a cyan circle of radius 22 at center (404, 36).
; PLAN: r0=404(x), r1=36(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 36
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
