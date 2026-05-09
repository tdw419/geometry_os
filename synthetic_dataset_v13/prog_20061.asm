; DESCRIPTION: Renders a green box of size 80x67 starting at (299, 82).
; PLAN: r0=299(x), r1=82(y), r2=80(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 82
LDI r2, 80
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
