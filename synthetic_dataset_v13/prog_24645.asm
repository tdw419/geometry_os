; DESCRIPTION: Creates a orange rectangular region at (46, 57) spanning 89 by 64 pixels.
; PLAN: r0=46(x), r1=57(y), r2=89(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 57
LDI r2, 89
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
