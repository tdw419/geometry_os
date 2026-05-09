; DESCRIPTION: Creates a red rectangular region at (175, 32) spanning 25 by 44 pixels.
; PLAN: r0=175(x), r1=32(y), r2=25(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 32
LDI r2, 25
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
