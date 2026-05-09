; DESCRIPTION: Creates a white rectangular region at (210, 46) spanning 16 by 118 pixels.
; PLAN: r0=210(x), r1=46(y), r2=16(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 46
LDI r2, 16
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
