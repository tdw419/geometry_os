; DESCRIPTION: Creates a magenta rectangular region at (262, 67) spanning 70 by 94 pixels.
; PLAN: r0=262(x), r1=67(y), r2=70(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 67
LDI r2, 70
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
