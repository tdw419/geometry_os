; DESCRIPTION: Creates a orange rectangular region at (401, 30) spanning 74 by 92 pixels.
; PLAN: r0=401(x), r1=30(y), r2=74(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 30
LDI r2, 74
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
