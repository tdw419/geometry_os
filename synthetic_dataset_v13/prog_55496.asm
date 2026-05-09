; DESCRIPTION: Creates a orange rectangular region at (52, 186) spanning 94 by 31 pixels.
; PLAN: r0=52(x), r1=186(y), r2=94(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 186
LDI r2, 94
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
