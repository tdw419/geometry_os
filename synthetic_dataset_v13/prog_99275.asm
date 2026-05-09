; DESCRIPTION: Renders a red box of size 111x75 starting at (245, 109).
; PLAN: r0=245(x), r1=109(y), r2=111(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 109
LDI r2, 111
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
