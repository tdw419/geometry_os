; DESCRIPTION: Renders a green box of size 116x73 starting at (104, 32).
; PLAN: r0=104(x), r1=32(y), r2=116(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 32
LDI r2, 116
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
