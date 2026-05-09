; DESCRIPTION: Renders a cyan disk with center (263, 111) and radius 36.
; PLAN: r0=263(x), r1=111(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 111
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
