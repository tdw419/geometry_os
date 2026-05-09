; DESCRIPTION: Creates a red rectangular region at (262, 64) spanning 25 by 36 pixels.
; PLAN: r0=262(x), r1=64(y), r2=25(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 64
LDI r2, 25
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
