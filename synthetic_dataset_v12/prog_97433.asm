; DESCRIPTION: Creates a yellow rectangular region at (360, 127) spanning 71 by 117 pixels.
; PLAN: r0=360(x), r1=127(y), r2=71(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 127
LDI r2, 71
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
