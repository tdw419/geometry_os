; DESCRIPTION: Creates a cyan rectangular region at (377, 58) spanning 36 by 96 pixels.
; PLAN: r0=377(x), r1=58(y), r2=36(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 58
LDI r2, 36
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
