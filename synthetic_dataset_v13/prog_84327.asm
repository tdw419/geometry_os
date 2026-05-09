; DESCRIPTION: Renders a blue box of size 59x21 starting at (404, 147).
; PLAN: r0=404(x), r1=147(y), r2=59(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 147
LDI r2, 59
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
