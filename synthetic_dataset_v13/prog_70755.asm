; DESCRIPTION: Creates a orange rectangular region at (94, 229) spanning 71 by 19 pixels.
; PLAN: r0=94(x), r1=229(y), r2=71(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 229
LDI r2, 71
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
