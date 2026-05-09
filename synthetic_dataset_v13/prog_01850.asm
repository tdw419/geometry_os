; DESCRIPTION: Renders a green box of size 84x67 starting at (98, 60).
; PLAN: r0=98(x), r1=60(y), r2=84(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 60
LDI r2, 84
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
