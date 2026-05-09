; DESCRIPTION: Renders a blue box of size 56x32 starting at (220, 187).
; PLAN: r0=220(x), r1=187(y), r2=56(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 187
LDI r2, 56
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
