; DESCRIPTION: Places a green 44x67 rectangle at position (414, 132).
; PLAN: r0=414(x), r1=132(y), r2=44(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 132
LDI r2, 44
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
