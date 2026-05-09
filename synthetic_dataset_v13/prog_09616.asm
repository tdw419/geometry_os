; DESCRIPTION: Creates a orange rectangular region at (406, 111) spanning 64 by 112 pixels.
; PLAN: r0=406(x), r1=111(y), r2=64(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 111
LDI r2, 64
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
