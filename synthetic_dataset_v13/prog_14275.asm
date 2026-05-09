; DESCRIPTION: Creates a orange rectangular region at (346, 157) spanning 45 by 58 pixels.
; PLAN: r0=346(x), r1=157(y), r2=45(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 157
LDI r2, 45
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
