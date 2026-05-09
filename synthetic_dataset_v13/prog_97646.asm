; DESCRIPTION: Renders a green box of size 84x75 starting at (320, 117).
; PLAN: r0=320(x), r1=117(y), r2=84(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 117
LDI r2, 84
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
