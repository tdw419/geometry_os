; DESCRIPTION: Creates a orange rectangular region at (57, 36) spanning 24 by 111 pixels.
; PLAN: r0=57(x), r1=36(y), r2=24(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 36
LDI r2, 24
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
