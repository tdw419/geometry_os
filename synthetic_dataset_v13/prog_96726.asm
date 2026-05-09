; DESCRIPTION: Creates a yellow rectangular region at (429, 117) spanning 77 by 56 pixels.
; PLAN: r0=429(x), r1=117(y), r2=77(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 117
LDI r2, 77
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
