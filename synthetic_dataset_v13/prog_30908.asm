; DESCRIPTION: Creates a red rectangular region at (168, 31) spanning 64 by 90 pixels.
; PLAN: r0=168(x), r1=31(y), r2=64(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 31
LDI r2, 64
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
