; DESCRIPTION: Creates a magenta circular shape at (446, 173) with radius 42.
; PLAN: r0=446(x), r1=173(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 173
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
