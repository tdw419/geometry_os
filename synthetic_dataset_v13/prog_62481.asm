; DESCRIPTION: Creates a orange rectangular region at (433, 29) spanning 73 by 86 pixels.
; PLAN: r0=433(x), r1=29(y), r2=73(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 29
LDI r2, 73
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
