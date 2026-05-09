; DESCRIPTION: Renders a black box of size 15x49 starting at (404, 171).
; PLAN: r0=404(x), r1=171(y), r2=15(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 171
LDI r2, 15
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
