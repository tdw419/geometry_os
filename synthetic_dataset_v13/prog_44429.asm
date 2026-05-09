; DESCRIPTION: Creates a orange rectangular region at (435, 34) spanning 76 by 111 pixels.
; PLAN: r0=435(x), r1=34(y), r2=76(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 34
LDI r2, 76
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
