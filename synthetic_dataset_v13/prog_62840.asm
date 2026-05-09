; DESCRIPTION: Creates a red circular shape at (330, 154) with radius 27.
; PLAN: r0=330(x), r1=154(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 154
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
