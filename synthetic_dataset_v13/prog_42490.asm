; DESCRIPTION: Renders a white box of size 96x30 starting at (404, 71).
; PLAN: r0=404(x), r1=71(y), r2=96(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 71
LDI r2, 96
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
