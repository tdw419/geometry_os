; DESCRIPTION: Creates a red rectangular region at (354, 152) spanning 114 by 63 pixels.
; PLAN: r0=354(x), r1=152(y), r2=114(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 152
LDI r2, 114
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
