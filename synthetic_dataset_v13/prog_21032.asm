; DESCRIPTION: Renders a green box of size 25x102 starting at (60, 135).
; PLAN: r0=60(x), r1=135(y), r2=25(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 135
LDI r2, 25
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
