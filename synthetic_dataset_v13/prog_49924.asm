; DESCRIPTION: Creates a cyan rectangular region at (288, 28) spanning 57 by 96 pixels.
; PLAN: r0=288(x), r1=28(y), r2=57(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 28
LDI r2, 57
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
