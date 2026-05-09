; DESCRIPTION: Creates a orange rectangular region at (300, 21) spanning 45 by 108 pixels.
; PLAN: r0=300(x), r1=21(y), r2=45(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 21
LDI r2, 45
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
