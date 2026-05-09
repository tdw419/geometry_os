; DESCRIPTION: Creates a white rectangular region at (352, 150) spanning 11 by 104 pixels.
; PLAN: r0=352(x), r1=150(y), r2=11(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 150
LDI r2, 11
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
