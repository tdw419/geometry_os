; DESCRIPTION: Creates a yellow rectangular region at (151, 120) spanning 57 by 14 pixels.
; PLAN: r0=151(x), r1=120(y), r2=57(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 120
LDI r2, 57
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
