; DESCRIPTION: Creates a red rectangular region at (255, 178) spanning 41 by 17 pixels.
; PLAN: r0=255(x), r1=178(y), r2=41(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 178
LDI r2, 41
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
