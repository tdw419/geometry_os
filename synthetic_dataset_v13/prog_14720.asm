; DESCRIPTION: Creates a orange rectangular region at (214, 57) spanning 112 by 79 pixels.
; PLAN: r0=214(x), r1=57(y), r2=112(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 57
LDI r2, 112
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
