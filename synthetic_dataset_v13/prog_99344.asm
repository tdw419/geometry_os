; DESCRIPTION: Creates a cyan rectangular region at (184, 57) spanning 101 by 12 pixels.
; PLAN: r0=184(x), r1=57(y), r2=101(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 57
LDI r2, 101
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
