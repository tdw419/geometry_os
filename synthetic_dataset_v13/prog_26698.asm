; DESCRIPTION: Creates a black rectangular region at (401, 74) spanning 86 by 77 pixels.
; PLAN: r0=401(x), r1=74(y), r2=86(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 74
LDI r2, 86
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
