; DESCRIPTION: Creates a yellow rectangular region at (230, 87) spanning 27 by 23 pixels.
; PLAN: r0=230(x), r1=87(y), r2=27(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 87
LDI r2, 27
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
