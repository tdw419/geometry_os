; DESCRIPTION: Creates a orange rectangular region at (256, 29) spanning 98 by 48 pixels.
; PLAN: r0=256(x), r1=29(y), r2=98(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 29
LDI r2, 98
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
