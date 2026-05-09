; DESCRIPTION: Creates a orange rectangular region at (295, 198) spanning 87 by 28 pixels.
; PLAN: r0=295(x), r1=198(y), r2=87(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 198
LDI r2, 87
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
