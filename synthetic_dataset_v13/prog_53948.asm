; DESCRIPTION: Creates a red rectangular region at (74, 168) spanning 96 by 42 pixels.
; PLAN: r0=74(x), r1=168(y), r2=96(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 168
LDI r2, 96
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
