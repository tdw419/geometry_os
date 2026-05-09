; DESCRIPTION: Creates a magenta rectangular region at (129, 173) spanning 109 by 10 pixels.
; PLAN: r0=129(x), r1=173(y), r2=109(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 173
LDI r2, 109
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
