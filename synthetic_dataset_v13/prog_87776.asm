; DESCRIPTION: Creates a red rectangular region at (404, 184) spanning 15 by 41 pixels.
; PLAN: r0=404(x), r1=184(y), r2=15(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 184
LDI r2, 15
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
