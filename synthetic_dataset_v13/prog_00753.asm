; DESCRIPTION: Creates a red rectangular region at (330, 146) spanning 39 by 105 pixels.
; PLAN: r0=330(x), r1=146(y), r2=39(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 146
LDI r2, 39
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
