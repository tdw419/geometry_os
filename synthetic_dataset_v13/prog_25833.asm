; DESCRIPTION: Creates a cyan rectangular region at (167, 37) spanning 69 by 61 pixels.
; PLAN: r0=167(x), r1=37(y), r2=69(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 37
LDI r2, 69
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
