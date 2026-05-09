; DESCRIPTION: Places a green 84x95 rectangle at position (116, 72).
; PLAN: r0=116(x), r1=72(y), r2=84(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 72
LDI r2, 84
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
