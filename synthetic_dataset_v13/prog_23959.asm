; DESCRIPTION: Creates a red rectangular region at (480, 203) spanning 15 by 48 pixels.
; PLAN: r0=480(x), r1=203(y), r2=15(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 203
LDI r2, 15
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
