; DESCRIPTION: Renders a green box of size 68x86 starting at (58, 50).
; PLAN: r0=58(x), r1=50(y), r2=68(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 50
LDI r2, 68
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
