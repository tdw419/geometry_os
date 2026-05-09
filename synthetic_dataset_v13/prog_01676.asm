; DESCRIPTION: Creates a orange rectangular region at (300, 2) spanning 32 by 98 pixels.
; PLAN: r0=300(x), r1=2(y), r2=32(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 2
LDI r2, 32
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
