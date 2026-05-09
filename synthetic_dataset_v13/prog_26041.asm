; DESCRIPTION: Renders a cyan box of size 28x15 starting at (142, 185).
; PLAN: r0=142(x), r1=185(y), r2=28(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 185
LDI r2, 28
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
