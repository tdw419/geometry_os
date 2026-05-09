; DESCRIPTION: Creates a white rectangular region at (380, 111) spanning 94 by 100 pixels.
; PLAN: r0=380(x), r1=111(y), r2=94(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 111
LDI r2, 94
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
