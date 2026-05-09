; DESCRIPTION: Places a green 112x71 rectangle at position (258, 154).
; PLAN: r0=258(x), r1=154(y), r2=112(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 154
LDI r2, 112
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
