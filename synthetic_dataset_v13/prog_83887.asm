; DESCRIPTION: Creates a orange rectangular region at (387, 57) spanning 45 by 97 pixels.
; PLAN: r0=387(x), r1=57(y), r2=45(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 57
LDI r2, 45
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
