; DESCRIPTION: Renders a green box of size 85x111 starting at (104, 61).
; PLAN: r0=104(x), r1=61(y), r2=85(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 61
LDI r2, 85
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
