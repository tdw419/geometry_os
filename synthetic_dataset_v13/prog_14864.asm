; DESCRIPTION: Renders a black box of size 28x79 starting at (220, 103).
; PLAN: r0=220(x), r1=103(y), r2=28(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 103
LDI r2, 28
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
