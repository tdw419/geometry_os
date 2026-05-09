; DESCRIPTION: Renders a blue box of size 48x86 starting at (389, 165).
; PLAN: r0=389(x), r1=165(y), r2=48(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 165
LDI r2, 48
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
