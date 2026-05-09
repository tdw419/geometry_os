; DESCRIPTION: Creates a orange rectangular region at (177, 61) spanning 113 by 68 pixels.
; PLAN: r0=177(x), r1=61(y), r2=113(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 61
LDI r2, 113
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
