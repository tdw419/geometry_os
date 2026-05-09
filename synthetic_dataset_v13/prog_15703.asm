; DESCRIPTION: Creates a orange rectangular region at (228, 27) spanning 85 by 79 pixels.
; PLAN: r0=228(x), r1=27(y), r2=85(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 27
LDI r2, 85
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
