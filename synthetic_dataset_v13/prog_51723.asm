; DESCRIPTION: Creates a orange rectangular region at (394, 104) spanning 82 by 96 pixels.
; PLAN: r0=394(x), r1=104(y), r2=82(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 104
LDI r2, 82
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
