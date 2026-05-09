; DESCRIPTION: Renders a green disk with center (284, 64) and radius 60.
; PLAN: r0=284(x), r1=64(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 64
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
