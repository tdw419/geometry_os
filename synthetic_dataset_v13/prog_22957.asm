; DESCRIPTION: Creates a black rectangular region at (188, 165) spanning 92 by 64 pixels.
; PLAN: r0=188(x), r1=165(y), r2=92(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 165
LDI r2, 92
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
