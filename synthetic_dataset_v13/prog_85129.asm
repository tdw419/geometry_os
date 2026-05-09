; DESCRIPTION: Creates a orange rectangular region at (57, 28) spanning 98 by 40 pixels.
; PLAN: r0=57(x), r1=28(y), r2=98(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 28
LDI r2, 98
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
