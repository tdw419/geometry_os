; DESCRIPTION: Creates a blue rectangular region at (36, 154) spanning 54 by 42 pixels.
; PLAN: r0=36(x), r1=154(y), r2=54(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 154
LDI r2, 54
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
