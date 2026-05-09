; DESCRIPTION: Places a green 58x67 rectangle at position (408, 39).
; PLAN: r0=408(x), r1=39(y), r2=58(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 39
LDI r2, 58
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
