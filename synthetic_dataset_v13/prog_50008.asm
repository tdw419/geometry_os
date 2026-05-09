; DESCRIPTION: Creates a red rectangular region at (66, 223) spanning 20 by 28 pixels.
; PLAN: r0=66(x), r1=223(y), r2=20(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 223
LDI r2, 20
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
