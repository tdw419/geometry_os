; DESCRIPTION: Places a green 63x71 rectangle at position (116, 39).
; PLAN: r0=116(x), r1=39(y), r2=63(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 39
LDI r2, 63
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
