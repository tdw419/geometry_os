; DESCRIPTION: Creates a cyan rectangular region at (194, 121) spanning 92 by 63 pixels.
; PLAN: r0=194(x), r1=121(y), r2=92(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 121
LDI r2, 92
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
