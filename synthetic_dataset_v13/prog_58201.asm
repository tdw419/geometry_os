; DESCRIPTION: Creates a orange rectangular region at (45, 36) spanning 113 by 25 pixels.
; PLAN: r0=45(x), r1=36(y), r2=113(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 36
LDI r2, 113
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
