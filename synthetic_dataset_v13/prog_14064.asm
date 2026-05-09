; DESCRIPTION: Places a cyan circle of radius 10 at center (21, 168).
; PLAN: r0=21(x), r1=168(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 21
LDI r1, 168
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
