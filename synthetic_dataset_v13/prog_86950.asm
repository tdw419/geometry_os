; DESCRIPTION: Renders a blue box of size 100x48 starting at (202, 150).
; PLAN: r0=202(x), r1=150(y), r2=100(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 150
LDI r2, 100
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
