; DESCRIPTION: Renders a red box of size 23x27 starting at (489, 98).
; PLAN: r0=489(x), r1=98(y), r2=23(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 98
LDI r2, 23
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
