; DESCRIPTION: Creates a orange rectangular region at (372, 8) spanning 46 by 18 pixels.
; PLAN: r0=372(x), r1=8(y), r2=46(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 8
LDI r2, 46
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
