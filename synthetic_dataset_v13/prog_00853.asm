; DESCRIPTION: Creates a orange rectangular region at (358, 111) spanning 80 by 120 pixels.
; PLAN: r0=358(x), r1=111(y), r2=80(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 111
LDI r2, 80
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
