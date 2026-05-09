; DESCRIPTION: Renders a blue box of size 27x72 starting at (333, 109).
; PLAN: r0=333(x), r1=109(y), r2=27(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 109
LDI r2, 27
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
