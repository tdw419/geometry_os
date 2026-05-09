; DESCRIPTION: Creates a red rectangular region at (213, 29) spanning 111 by 87 pixels.
; PLAN: r0=213(x), r1=29(y), r2=111(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 29
LDI r2, 111
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
