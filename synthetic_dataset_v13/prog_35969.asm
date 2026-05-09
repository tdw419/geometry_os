; DESCRIPTION: Creates a red rectangular region at (239, 111) spanning 54 by 113 pixels.
; PLAN: r0=239(x), r1=111(y), r2=54(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 111
LDI r2, 54
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
