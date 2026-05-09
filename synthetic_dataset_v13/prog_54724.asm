; DESCRIPTION: Creates a magenta circular shape at (445, 229) with radius 14.
; PLAN: r0=445(x), r1=229(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 229
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
