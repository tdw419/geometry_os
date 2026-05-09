; DESCRIPTION: Creates a red rectangular region at (281, 42) spanning 77 by 62 pixels.
; PLAN: r0=281(x), r1=42(y), r2=77(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 42
LDI r2, 77
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
