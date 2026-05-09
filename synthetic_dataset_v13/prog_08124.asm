; DESCRIPTION: Creates a orange rectangular region at (280, 7) spanning 117 by 64 pixels.
; PLAN: r0=280(x), r1=7(y), r2=117(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 7
LDI r2, 117
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
