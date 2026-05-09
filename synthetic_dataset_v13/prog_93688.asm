; DESCRIPTION: Renders a blue box of size 80x42 starting at (140, 164).
; PLAN: r0=140(x), r1=164(y), r2=80(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 164
LDI r2, 80
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
