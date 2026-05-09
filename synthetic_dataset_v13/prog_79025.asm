; DESCRIPTION: Creates a white rectangular region at (410, 104) spanning 63 by 43 pixels.
; PLAN: r0=410(x), r1=104(y), r2=63(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 104
LDI r2, 63
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
