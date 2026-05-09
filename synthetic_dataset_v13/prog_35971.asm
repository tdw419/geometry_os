; DESCRIPTION: Places a black 38x90 rectangle at position (453, 78).
; PLAN: r0=453(x), r1=78(y), r2=38(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 78
LDI r2, 38
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
