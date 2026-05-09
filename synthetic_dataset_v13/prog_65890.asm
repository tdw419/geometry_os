; DESCRIPTION: Renders a green box of size 16x102 starting at (33, 8).
; PLAN: r0=33(x), r1=8(y), r2=16(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 8
LDI r2, 16
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
