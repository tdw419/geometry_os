; DESCRIPTION: Renders a blue box of size 48x94 starting at (268, 16).
; PLAN: r0=268(x), r1=16(y), r2=48(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 16
LDI r2, 48
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
