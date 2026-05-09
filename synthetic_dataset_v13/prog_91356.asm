; DESCRIPTION: Creates a red rectangular region at (52, 42) spanning 27 by 54 pixels.
; PLAN: r0=52(x), r1=42(y), r2=27(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 42
LDI r2, 27
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
