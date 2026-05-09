; DESCRIPTION: Renders a cyan disk with center (328, 214) and radius 38.
; PLAN: r0=328(x), r1=214(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 214
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
