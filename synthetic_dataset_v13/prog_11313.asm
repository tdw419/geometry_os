; DESCRIPTION: Renders a blue box of size 104x16 starting at (241, 96).
; PLAN: r0=241(x), r1=96(y), r2=104(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 96
LDI r2, 104
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
