; DESCRIPTION: Creates a green rectangular region at (304, 142) spanning 41 by 113 pixels.
; PLAN: r0=304(x), r1=142(y), r2=41(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 142
LDI r2, 41
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
