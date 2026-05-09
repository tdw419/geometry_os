; DESCRIPTION: Creates a white rectangular region at (44, 154) spanning 42 by 87 pixels.
; PLAN: r0=44(x), r1=154(y), r2=42(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 154
LDI r2, 42
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
