; DESCRIPTION: Renders a yellow box of size 58x42 starting at (253, 44).
; PLAN: r0=253(x), r1=44(y), r2=58(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 44
LDI r2, 58
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
