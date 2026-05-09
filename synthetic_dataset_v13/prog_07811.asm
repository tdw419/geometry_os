; DESCRIPTION: Renders a red box of size 27x65 starting at (436, 5).
; PLAN: r0=436(x), r1=5(y), r2=27(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 5
LDI r2, 27
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
