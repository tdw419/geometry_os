; DESCRIPTION: Creates a red circular shape at (63, 168) with radius 63.
; PLAN: r0=63(x), r1=168(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 168
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
