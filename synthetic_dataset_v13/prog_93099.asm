; DESCRIPTION: Creates a magenta circular shape at (392, 107) with radius 52.
; PLAN: r0=392(x), r1=107(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 107
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
