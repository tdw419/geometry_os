; DESCRIPTION: Renders a blue box of size 69x86 starting at (404, 140).
; PLAN: r0=404(x), r1=140(y), r2=69(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 140
LDI r2, 69
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
