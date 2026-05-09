; DESCRIPTION: Renders a purple box of size 46x77 starting at (404, 168).
; PLAN: r0=404(x), r1=168(y), r2=46(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 168
LDI r2, 46
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
