; DESCRIPTION: Creates a white rectangular region at (36, 44) spanning 16 by 65 pixels.
; PLAN: r0=36(x), r1=44(y), r2=16(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 44
LDI r2, 16
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
