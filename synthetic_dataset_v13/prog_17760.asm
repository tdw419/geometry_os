; DESCRIPTION: Renders a yellow box of size 85x67 starting at (294, 145).
; PLAN: r0=294(x), r1=145(y), r2=85(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 145
LDI r2, 85
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
