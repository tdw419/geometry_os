; DESCRIPTION: Creates a red circular shape at (489, 215) with radius 22.
; PLAN: r0=489(x), r1=215(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 489
LDI r1, 215
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
