; DESCRIPTION: Renders a blue box of size 38x42 starting at (201, 196).
; PLAN: r0=201(x), r1=196(y), r2=38(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 196
LDI r2, 38
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
