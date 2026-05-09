; DESCRIPTION: Creates a black circular shape at (410, 168) with radius 68.
; PLAN: r0=410(x), r1=168(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 168
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
