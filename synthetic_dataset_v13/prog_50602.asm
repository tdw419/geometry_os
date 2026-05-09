; DESCRIPTION: Creates a cyan rectangular region at (12, 92) spanning 101 by 112 pixels.
; PLAN: r0=12(x), r1=92(y), r2=101(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 92
LDI r2, 101
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
