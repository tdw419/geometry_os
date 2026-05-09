; DESCRIPTION: Creates a magenta rectangular region at (220, 41) spanning 47 by 21 pixels.
; PLAN: r0=220(x), r1=41(y), r2=47(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 41
LDI r2, 47
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
