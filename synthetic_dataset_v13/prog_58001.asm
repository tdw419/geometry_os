; DESCRIPTION: Creates a cyan rectangular region at (412, 92) spanning 14 by 52 pixels.
; PLAN: r0=412(x), r1=92(y), r2=14(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 92
LDI r2, 14
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
