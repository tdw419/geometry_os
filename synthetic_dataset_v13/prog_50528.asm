; DESCRIPTION: Creates a red rectangular region at (388, 13) spanning 61 by 44 pixels.
; PLAN: r0=388(x), r1=13(y), r2=61(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 13
LDI r2, 61
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
