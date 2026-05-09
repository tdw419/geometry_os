; DESCRIPTION: Creates a red rectangular region at (450, 42) spanning 36 by 54 pixels.
; PLAN: r0=450(x), r1=42(y), r2=36(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 42
LDI r2, 36
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
