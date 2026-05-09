; DESCRIPTION: Creates a red rectangular region at (209, 109) spanning 90 by 64 pixels.
; PLAN: r0=209(x), r1=109(y), r2=90(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 109
LDI r2, 90
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
