; DESCRIPTION: Creates a red rectangular region at (315, 50) spanning 42 by 22 pixels.
; PLAN: r0=315(x), r1=50(y), r2=42(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 50
LDI r2, 42
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
