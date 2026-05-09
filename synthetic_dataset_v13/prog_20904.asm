; DESCRIPTION: Renders a blue box of size 57x79 starting at (412, 13).
; PLAN: r0=412(x), r1=13(y), r2=57(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 13
LDI r2, 57
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
