; DESCRIPTION: Renders a blue box of size 104x103 starting at (87, 108).
; PLAN: r0=87(x), r1=108(y), r2=104(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 108
LDI r2, 104
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
