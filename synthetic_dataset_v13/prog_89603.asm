; DESCRIPTION: Renders a green box of size 42x62 starting at (43, 142).
; PLAN: r0=43(x), r1=142(y), r2=42(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 142
LDI r2, 42
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
