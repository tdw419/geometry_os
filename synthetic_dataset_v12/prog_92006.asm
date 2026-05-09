; DESCRIPTION: Renders a blue box of size 21x116 starting at (475, 82).
; PLAN: r0=475(x), r1=82(y), r2=21(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 82
LDI r2, 21
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
