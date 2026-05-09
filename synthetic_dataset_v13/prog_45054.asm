; DESCRIPTION: Creates a yellow rectangular region at (75, 32) spanning 117 by 47 pixels.
; PLAN: r0=75(x), r1=32(y), r2=117(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 32
LDI r2, 117
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
