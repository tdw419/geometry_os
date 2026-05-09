; DESCRIPTION: Creates a white rectangular region at (408, 135) spanning 16 by 102 pixels.
; PLAN: r0=408(x), r1=135(y), r2=16(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 135
LDI r2, 16
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
