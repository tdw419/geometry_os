; DESCRIPTION: Creates a orange rectangular region at (447, 180) spanning 32 by 54 pixels.
; PLAN: r0=447(x), r1=180(y), r2=32(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 180
LDI r2, 32
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
