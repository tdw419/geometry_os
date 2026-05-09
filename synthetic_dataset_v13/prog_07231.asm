; DESCRIPTION: Creates a red rectangular region at (288, 125) spanning 66 by 91 pixels.
; PLAN: r0=288(x), r1=125(y), r2=66(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 125
LDI r2, 66
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
