; DESCRIPTION: Creates a cyan rectangular region at (384, 15) spanning 92 by 22 pixels.
; PLAN: r0=384(x), r1=15(y), r2=92(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 15
LDI r2, 92
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
