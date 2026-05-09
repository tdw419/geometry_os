; DESCRIPTION: Creates a orange rectangular region at (258, 120) spanning 117 by 32 pixels.
; PLAN: r0=258(x), r1=120(y), r2=117(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 120
LDI r2, 117
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
