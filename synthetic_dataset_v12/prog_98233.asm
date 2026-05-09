; DESCRIPTION: Creates a orange rectangular region at (446, 19) spanning 40 by 28 pixels.
; PLAN: r0=446(x), r1=19(y), r2=40(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 19
LDI r2, 40
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
