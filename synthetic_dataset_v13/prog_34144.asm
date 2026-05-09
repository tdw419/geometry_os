; DESCRIPTION: Creates a orange rectangular region at (446, 31) spanning 47 by 28 pixels.
; PLAN: r0=446(x), r1=31(y), r2=47(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 31
LDI r2, 47
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
