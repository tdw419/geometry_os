; DESCRIPTION: Renders a green box of size 80x115 starting at (203, 60).
; PLAN: r0=203(x), r1=60(y), r2=80(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 60
LDI r2, 80
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
