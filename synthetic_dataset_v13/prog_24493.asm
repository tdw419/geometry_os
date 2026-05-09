; DESCRIPTION: Creates a cyan rectangular region at (377, 19) spanning 64 by 29 pixels.
; PLAN: r0=377(x), r1=19(y), r2=64(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 19
LDI r2, 64
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
