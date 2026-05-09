; DESCRIPTION: Creates a red rectangular region at (459, 220) spanning 42 by 34 pixels.
; PLAN: r0=459(x), r1=220(y), r2=42(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 220
LDI r2, 42
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
