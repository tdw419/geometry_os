; DESCRIPTION: Creates a orange rectangular region at (218, 111) spanning 117 by 113 pixels.
; PLAN: r0=218(x), r1=111(y), r2=117(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 111
LDI r2, 117
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
