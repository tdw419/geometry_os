; DESCRIPTION: Creates a white rectangular region at (341, 152) spanning 111 by 41 pixels.
; PLAN: r0=341(x), r1=152(y), r2=111(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 152
LDI r2, 111
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
