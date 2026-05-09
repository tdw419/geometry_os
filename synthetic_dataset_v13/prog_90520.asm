; DESCRIPTION: Renders a green box of size 69x86 starting at (251, 104).
; PLAN: r0=251(x), r1=104(y), r2=69(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 104
LDI r2, 69
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
