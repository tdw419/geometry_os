; DESCRIPTION: Creates a white rectangular region at (236, 94) spanning 111 by 68 pixels.
; PLAN: r0=236(x), r1=94(y), r2=111(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 94
LDI r2, 111
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
