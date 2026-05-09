; DESCRIPTION: Renders a red box of size 111x78 starting at (391, 46).
; PLAN: r0=391(x), r1=46(y), r2=111(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 46
LDI r2, 111
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
