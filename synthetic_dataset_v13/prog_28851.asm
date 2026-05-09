; DESCRIPTION: Creates a magenta rectangular region at (65, 221) spanning 21 by 17 pixels.
; PLAN: r0=65(x), r1=221(y), r2=21(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 221
LDI r2, 21
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
