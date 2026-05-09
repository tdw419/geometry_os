; DESCRIPTION: Renders a white box of size 104x92 starting at (63, 108).
; PLAN: r0=63(x), r1=108(y), r2=104(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 108
LDI r2, 104
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
