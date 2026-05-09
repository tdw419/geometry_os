; DESCRIPTION: Creates a orange rectangular region at (384, 50) spanning 85 by 25 pixels.
; PLAN: r0=384(x), r1=50(y), r2=85(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 50
LDI r2, 85
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
