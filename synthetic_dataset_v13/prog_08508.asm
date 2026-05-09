; DESCRIPTION: Creates a red rectangular region at (105, 59) spanning 113 by 105 pixels.
; PLAN: r0=105(x), r1=59(y), r2=113(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 59
LDI r2, 113
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
