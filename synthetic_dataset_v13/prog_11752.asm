; DESCRIPTION: Creates a orange rectangular region at (27, 39) spanning 94 by 54 pixels.
; PLAN: r0=27(x), r1=39(y), r2=94(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 39
LDI r2, 94
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
