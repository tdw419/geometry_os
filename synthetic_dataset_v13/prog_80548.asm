; DESCRIPTION: Creates a yellow rectangular region at (379, 129) spanning 36 by 42 pixels.
; PLAN: r0=379(x), r1=129(y), r2=36(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 129
LDI r2, 36
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
