; DESCRIPTION: Creates a orange rectangular region at (374, 24) spanning 100 by 16 pixels.
; PLAN: r0=374(x), r1=24(y), r2=100(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 24
LDI r2, 100
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
