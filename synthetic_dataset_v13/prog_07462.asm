; DESCRIPTION: Creates a yellow rectangular region at (458, 5) spanning 27 by 32 pixels.
; PLAN: r0=458(x), r1=5(y), r2=27(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 5
LDI r2, 27
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
