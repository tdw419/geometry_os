; DESCRIPTION: Renders a green box of size 109x80 starting at (245, 167).
; PLAN: r0=245(x), r1=167(y), r2=109(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 167
LDI r2, 109
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
