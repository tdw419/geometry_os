; DESCRIPTION: Creates a red rectangular region at (150, 29) spanning 15 by 16 pixels.
; PLAN: r0=150(x), r1=29(y), r2=15(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 29
LDI r2, 15
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
