; DESCRIPTION: Creates a red rectangular region at (380, 125) spanning 22 by 15 pixels.
; PLAN: r0=380(x), r1=125(y), r2=22(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 125
LDI r2, 22
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
