; DESCRIPTION: Renders a green box of size 120x38 starting at (94, 144).
; PLAN: r0=94(x), r1=144(y), r2=120(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 144
LDI r2, 120
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
