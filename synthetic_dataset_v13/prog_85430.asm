; DESCRIPTION: Creates a magenta circular shape at (295, 229) with radius 13.
; PLAN: r0=295(x), r1=229(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 229
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
