; DESCRIPTION: Renders a magenta disk with center (344, 190) and radius 16.
; PLAN: r0=344(x), r1=190(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 190
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
