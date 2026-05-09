; DESCRIPTION: Renders a green box of size 101x11 starting at (228, 135).
; PLAN: r0=228(x), r1=135(y), r2=101(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 135
LDI r2, 101
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
