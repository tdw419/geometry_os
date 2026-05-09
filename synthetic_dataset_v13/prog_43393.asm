; DESCRIPTION: Creates a white rectangular region at (222, 186) spanning 54 by 64 pixels.
; PLAN: r0=222(x), r1=186(y), r2=54(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 186
LDI r2, 54
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
