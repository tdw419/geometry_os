; DESCRIPTION: Creates a orange rectangular region at (209, 112) spanning 94 by 76 pixels.
; PLAN: r0=209(x), r1=112(y), r2=94(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 112
LDI r2, 94
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
