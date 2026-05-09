; DESCRIPTION: Creates a cyan rectangular region at (28, 53) spanning 98 by 92 pixels.
; PLAN: r0=28(x), r1=53(y), r2=98(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 53
LDI r2, 98
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
