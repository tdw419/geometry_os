; DESCRIPTION: Creates a orange rectangular region at (293, 111) spanning 54 by 95 pixels.
; PLAN: r0=293(x), r1=111(y), r2=54(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 111
LDI r2, 54
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
