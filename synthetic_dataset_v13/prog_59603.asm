; DESCRIPTION: Creates a orange rectangular region at (122, 228) spanning 90 by 25 pixels.
; PLAN: r0=122(x), r1=228(y), r2=90(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 228
LDI r2, 90
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
