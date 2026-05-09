; DESCRIPTION: Renders a green box of size 59x67 starting at (63, 95).
; PLAN: r0=63(x), r1=95(y), r2=59(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 95
LDI r2, 59
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
