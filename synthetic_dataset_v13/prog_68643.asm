; DESCRIPTION: Renders a green box of size 113x86 starting at (395, 80).
; PLAN: r0=395(x), r1=80(y), r2=113(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 80
LDI r2, 113
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
