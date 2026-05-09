; DESCRIPTION: Renders a green box of size 34x59 starting at (320, 34).
; PLAN: r0=320(x), r1=34(y), r2=34(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 34
LDI r2, 34
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
