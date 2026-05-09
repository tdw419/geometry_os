; DESCRIPTION: Renders a yellow box of size 104x11 starting at (404, 183).
; PLAN: r0=404(x), r1=183(y), r2=104(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 183
LDI r2, 104
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
