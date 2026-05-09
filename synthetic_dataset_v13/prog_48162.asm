; DESCRIPTION: Creates a yellow circular shape at (446, 209) with radius 42.
; PLAN: r0=446(x), r1=209(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 209
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
