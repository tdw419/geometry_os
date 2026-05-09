; DESCRIPTION: Creates a orange rectangular region at (66, 221) spanning 19 by 34 pixels.
; PLAN: r0=66(x), r1=221(y), r2=19(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 221
LDI r2, 19
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
