; DESCRIPTION: Creates a orange rectangular region at (400, 128) spanning 79 by 79 pixels.
; PLAN: r0=400(x), r1=128(y), r2=79(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 128
LDI r2, 79
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
