; DESCRIPTION: Creates a red rectangular region at (192, 117) spanning 100 by 16 pixels.
; PLAN: r0=192(x), r1=117(y), r2=100(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 117
LDI r2, 100
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
