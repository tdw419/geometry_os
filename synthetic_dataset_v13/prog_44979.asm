; DESCRIPTION: Renders a white box of size 84x55 starting at (404, 183).
; PLAN: r0=404(x), r1=183(y), r2=84(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 183
LDI r2, 84
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
