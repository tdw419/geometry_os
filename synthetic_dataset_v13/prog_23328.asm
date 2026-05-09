; DESCRIPTION: Renders a red box of size 12x65 starting at (374, 68).
; PLAN: r0=374(x), r1=68(y), r2=12(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 68
LDI r2, 12
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
