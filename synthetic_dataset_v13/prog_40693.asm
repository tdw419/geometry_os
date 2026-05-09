; DESCRIPTION: Creates a magenta circular shape at (242, 154) with radius 37.
; PLAN: r0=242(x), r1=154(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 154
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
