; DESCRIPTION: Creates a white rectangular region at (193, 43) spanning 111 by 68 pixels.
; PLAN: r0=193(x), r1=43(y), r2=111(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 43
LDI r2, 111
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
