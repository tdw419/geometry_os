; DESCRIPTION: Creates a orange rectangular region at (346, 45) spanning 11 by 24 pixels.
; PLAN: r0=346(x), r1=45(y), r2=11(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 45
LDI r2, 11
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
