; DESCRIPTION: Creates a orange rectangular region at (237, 5) spanning 96 by 55 pixels.
; PLAN: r0=237(x), r1=5(y), r2=96(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 5
LDI r2, 96
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
