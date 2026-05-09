; DESCRIPTION: Renders a magenta disk with center (405, 190) and radius 64.
; PLAN: r0=405(x), r1=190(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 190
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
