; DESCRIPTION: Creates a white rectangular region at (386, 75) spanning 32 by 104 pixels.
; PLAN: r0=386(x), r1=75(y), r2=32(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 75
LDI r2, 32
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
