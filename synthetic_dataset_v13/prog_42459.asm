; DESCRIPTION: Creates a orange rectangular region at (286, 150) spanning 58 by 28 pixels.
; PLAN: r0=286(x), r1=150(y), r2=58(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 150
LDI r2, 58
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
