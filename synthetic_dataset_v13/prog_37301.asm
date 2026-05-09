; DESCRIPTION: Renders a blue box of size 54x86 starting at (381, 142).
; PLAN: r0=381(x), r1=142(y), r2=54(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 142
LDI r2, 54
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
