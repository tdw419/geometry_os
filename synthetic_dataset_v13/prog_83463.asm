; DESCRIPTION: Creates a red rectangular region at (201, 146) spanning 42 by 36 pixels.
; PLAN: r0=201(x), r1=146(y), r2=42(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 146
LDI r2, 42
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
