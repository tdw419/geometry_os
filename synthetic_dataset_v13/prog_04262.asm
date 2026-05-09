; DESCRIPTION: Creates a orange rectangular region at (447, 207) spanning 38 by 13 pixels.
; PLAN: r0=447(x), r1=207(y), r2=38(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 207
LDI r2, 38
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
