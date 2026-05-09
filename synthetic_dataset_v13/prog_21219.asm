; DESCRIPTION: Renders a purple box of size 104x45 starting at (28, 127).
; PLAN: r0=28(x), r1=127(y), r2=104(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 127
LDI r2, 104
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
