; DESCRIPTION: Creates a white rectangular region at (302, 181) spanning 64 by 72 pixels.
; PLAN: r0=302(x), r1=181(y), r2=64(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 181
LDI r2, 64
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
