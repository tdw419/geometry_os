; DESCRIPTION: Renders a green box of size 62x86 starting at (305, 158).
; PLAN: r0=305(x), r1=158(y), r2=62(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 158
LDI r2, 62
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
