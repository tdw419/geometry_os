; DESCRIPTION: Creates a cyan circular shape at (404, 160) with radius 40.
; PLAN: r0=404(x), r1=160(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 160
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
