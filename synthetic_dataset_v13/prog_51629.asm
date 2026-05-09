; DESCRIPTION: Creates a magenta circular shape at (434, 168) with radius 65.
; PLAN: r0=434(x), r1=168(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 168
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
