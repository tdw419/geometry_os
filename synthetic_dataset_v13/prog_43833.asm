; DESCRIPTION: Renders a green box of size 38x23 starting at (450, 199).
; PLAN: r0=450(x), r1=199(y), r2=38(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 199
LDI r2, 38
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
