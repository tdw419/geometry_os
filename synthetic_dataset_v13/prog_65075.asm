; DESCRIPTION: Creates a red rectangular region at (320, 210) spanning 16 by 11 pixels.
; PLAN: r0=320(x), r1=210(y), r2=16(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 210
LDI r2, 16
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
