; DESCRIPTION: Creates a purple rectangular region at (239, 221) spanning 95 by 20 pixels.
; PLAN: r0=239(x), r1=221(y), r2=95(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 221
LDI r2, 95
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
