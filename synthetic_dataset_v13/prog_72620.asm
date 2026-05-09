; DESCRIPTION: Creates a red rectangular region at (328, 21) spanning 111 by 29 pixels.
; PLAN: r0=328(x), r1=21(y), r2=111(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 21
LDI r2, 111
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
