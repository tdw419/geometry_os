; DESCRIPTION: Renders a green box of size 69x32 starting at (340, 117).
; PLAN: r0=340(x), r1=117(y), r2=69(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 117
LDI r2, 69
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
