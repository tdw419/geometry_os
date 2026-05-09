; DESCRIPTION: Renders a yellow box of size 64x67 starting at (221, 8).
; PLAN: r0=221(x), r1=8(y), r2=64(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 8
LDI r2, 64
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
