; DESCRIPTION: Creates a orange rectangular region at (140, 164) spanning 74 by 74 pixels.
; PLAN: r0=140(x), r1=164(y), r2=74(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 164
LDI r2, 74
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
