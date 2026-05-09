; DESCRIPTION: Renders a green box of size 42x86 starting at (86, 17).
; PLAN: r0=86(x), r1=17(y), r2=42(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 17
LDI r2, 42
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
