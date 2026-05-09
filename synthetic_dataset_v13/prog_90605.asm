; DESCRIPTION: Creates a white rectangular region at (378, 50) spanning 104 by 30 pixels.
; PLAN: r0=378(x), r1=50(y), r2=104(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 50
LDI r2, 104
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
