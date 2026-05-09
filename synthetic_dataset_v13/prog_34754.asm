; DESCRIPTION: Creates a red rectangular region at (320, 151) spanning 87 by 50 pixels.
; PLAN: r0=320(x), r1=151(y), r2=87(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 151
LDI r2, 87
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
