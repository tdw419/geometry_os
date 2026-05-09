; DESCRIPTION: Creates a magenta rectangular region at (398, 28) spanning 19 by 109 pixels.
; PLAN: r0=398(x), r1=28(y), r2=19(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 28
LDI r2, 19
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
