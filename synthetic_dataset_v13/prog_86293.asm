; DESCRIPTION: Places a cyan circle of radius 21 at center (400, 150).
; PLAN: r0=400(x), r1=150(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 150
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
