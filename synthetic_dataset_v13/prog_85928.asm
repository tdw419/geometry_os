; DESCRIPTION: Creates a red rectangular region at (404, 121) spanning 23 by 15 pixels.
; PLAN: r0=404(x), r1=121(y), r2=23(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 121
LDI r2, 23
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
