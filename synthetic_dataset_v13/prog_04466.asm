; DESCRIPTION: Creates a yellow rectangular region at (193, 151) spanning 30 by 23 pixels.
; PLAN: r0=193(x), r1=151(y), r2=30(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 151
LDI r2, 30
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
