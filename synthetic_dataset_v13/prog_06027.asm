; DESCRIPTION: Creates a black rectangular region at (228, 167) spanning 104 by 46 pixels.
; PLAN: r0=228(x), r1=167(y), r2=104(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 167
LDI r2, 104
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
