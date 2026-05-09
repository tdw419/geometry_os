; DESCRIPTION: Creates a red rectangular region at (435, 16) spanning 45 by 103 pixels.
; PLAN: r0=435(x), r1=16(y), r2=45(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 16
LDI r2, 45
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
