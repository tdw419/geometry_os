; DESCRIPTION: Creates a yellow rectangular region at (61, 225) spanning 12 by 12 pixels.
; PLAN: r0=61(x), r1=225(y), r2=12(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 225
LDI r2, 12
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
