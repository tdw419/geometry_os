; DESCRIPTION: Creates a white rectangular region at (107, 32) spanning 111 by 44 pixels.
; PLAN: r0=107(x), r1=32(y), r2=111(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 32
LDI r2, 111
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
