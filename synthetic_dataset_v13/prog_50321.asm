; DESCRIPTION: Creates a magenta rectangular region at (422, 27) spanning 77 by 85 pixels.
; PLAN: r0=422(x), r1=27(y), r2=77(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 27
LDI r2, 77
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
