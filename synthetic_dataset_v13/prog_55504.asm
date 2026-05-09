; DESCRIPTION: Creates a magenta rectangular region at (360, 109) spanning 39 by 117 pixels.
; PLAN: r0=360(x), r1=109(y), r2=39(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 109
LDI r2, 39
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
