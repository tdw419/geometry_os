; DESCRIPTION: Creates a orange rectangular region at (159, 111) spanning 95 by 107 pixels.
; PLAN: r0=159(x), r1=111(y), r2=95(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 111
LDI r2, 95
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
