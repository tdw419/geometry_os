; DESCRIPTION: Renders a cyan disk with center (384, 67) and radius 63.
; PLAN: r0=384(x), r1=67(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 67
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
