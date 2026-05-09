; DESCRIPTION: Creates a white rectangular region at (352, 13) spanning 109 by 18 pixels.
; PLAN: r0=352(x), r1=13(y), r2=109(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 13
LDI r2, 109
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
