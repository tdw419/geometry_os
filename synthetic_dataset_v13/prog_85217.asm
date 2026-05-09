; DESCRIPTION: Creates a blue rectangular region at (211, 228) spanning 62 by 14 pixels.
; PLAN: r0=211(x), r1=228(y), r2=62(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 228
LDI r2, 62
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
