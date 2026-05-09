; DESCRIPTION: Renders a red box of size 18x52 starting at (404, 94).
; PLAN: r0=404(x), r1=94(y), r2=18(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 94
LDI r2, 18
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
