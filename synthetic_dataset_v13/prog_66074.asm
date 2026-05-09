; DESCRIPTION: Creates a cyan rectangular region at (64, 95) spanning 40 by 105 pixels.
; PLAN: r0=64(x), r1=95(y), r2=40(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 95
LDI r2, 40
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
