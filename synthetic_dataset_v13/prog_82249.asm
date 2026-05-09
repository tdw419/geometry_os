; DESCRIPTION: Creates a red rectangular region at (42, 85) spanning 37 by 27 pixels.
; PLAN: r0=42(x), r1=85(y), r2=37(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 85
LDI r2, 37
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
