; DESCRIPTION: Renders a purple box of size 104x33 starting at (13, 164).
; PLAN: r0=13(x), r1=164(y), r2=104(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 164
LDI r2, 104
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
