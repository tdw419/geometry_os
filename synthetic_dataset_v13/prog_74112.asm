; DESCRIPTION: Creates a orange rectangular region at (358, 125) spanning 60 by 57 pixels.
; PLAN: r0=358(x), r1=125(y), r2=60(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 125
LDI r2, 60
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
