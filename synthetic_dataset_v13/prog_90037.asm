; DESCRIPTION: Creates a white rectangular region at (434, 74) spanning 16 by 60 pixels.
; PLAN: r0=434(x), r1=74(y), r2=16(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 74
LDI r2, 16
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
