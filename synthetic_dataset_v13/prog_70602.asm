; DESCRIPTION: Creates a orange rectangular region at (358, 225) spanning 80 by 19 pixels.
; PLAN: r0=358(x), r1=225(y), r2=80(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 225
LDI r2, 80
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
