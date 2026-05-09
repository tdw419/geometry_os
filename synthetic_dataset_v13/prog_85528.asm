; DESCRIPTION: Places a green 46x67 rectangle at position (195, 2).
; PLAN: r0=195(x), r1=2(y), r2=46(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 2
LDI r2, 46
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
