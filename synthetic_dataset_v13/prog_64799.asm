; DESCRIPTION: Renders a yellow box of size 46x40 starting at (404, 39).
; PLAN: r0=404(x), r1=39(y), r2=46(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 39
LDI r2, 46
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
