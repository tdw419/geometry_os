; DESCRIPTION: Renders a blue box of size 95x60 starting at (16, 154).
; PLAN: r0=16(x), r1=154(y), r2=95(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 154
LDI r2, 95
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
