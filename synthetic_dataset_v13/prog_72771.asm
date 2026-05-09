; DESCRIPTION: Creates a orange rectangular region at (295, 98) spanning 92 by 19 pixels.
; PLAN: r0=295(x), r1=98(y), r2=92(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 98
LDI r2, 92
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
