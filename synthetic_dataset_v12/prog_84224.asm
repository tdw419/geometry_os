; DESCRIPTION: Creates a green rectangular region at (46, 126) spanning 12 by 42 pixels.
; PLAN: r0=46(x), r1=126(y), r2=12(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 126
LDI r2, 12
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
