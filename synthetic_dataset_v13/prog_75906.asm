; DESCRIPTION: Creates a red rectangular region at (352, 111) spanning 39 by 25 pixels.
; PLAN: r0=352(x), r1=111(y), r2=39(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 111
LDI r2, 39
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
