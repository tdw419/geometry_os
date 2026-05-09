; DESCRIPTION: Places a magenta 34x90 rectangle at position (341, 40).
; PLAN: r0=341(x), r1=40(y), r2=34(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 40
LDI r2, 34
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
