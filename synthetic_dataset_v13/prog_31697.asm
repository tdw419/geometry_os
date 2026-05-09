; DESCRIPTION: Creates a magenta circular shape at (231, 161) with radius 50.
; PLAN: r0=231(x), r1=161(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 161
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
