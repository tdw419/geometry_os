; DESCRIPTION: Draws a black rectangle at (404, 154) with width 92 and height 64.
; PLAN: r0=404(x), r1=154(y), r2=92(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 154
LDI r2, 92
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
