; DESCRIPTION: Renders a purple box of size 95x59 starting at (180, 182).
; PLAN: r0=180(x), r1=182(y), r2=95(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 182
LDI r2, 95
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
