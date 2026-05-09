; DESCRIPTION: Renders a green box of size 90x64 starting at (381, 92).
; PLAN: r0=381(x), r1=92(y), r2=90(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 92
LDI r2, 90
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
