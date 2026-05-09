; DESCRIPTION: Creates a cyan rectangular region at (185, 128) spanning 92 by 106 pixels.
; PLAN: r0=185(x), r1=128(y), r2=92(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 128
LDI r2, 92
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
