; DESCRIPTION: Creates a orange rectangular region at (267, 75) spanning 77 by 120 pixels.
; PLAN: r0=267(x), r1=75(y), r2=77(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 75
LDI r2, 77
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
