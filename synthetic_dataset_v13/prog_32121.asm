; DESCRIPTION: Renders a blue box of size 48x90 starting at (400, 101).
; PLAN: r0=400(x), r1=101(y), r2=48(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 101
LDI r2, 48
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
