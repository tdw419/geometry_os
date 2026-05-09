; DESCRIPTION: Renders a black box of size 115x78 starting at (392, 125).
; PLAN: r0=392(x), r1=125(y), r2=115(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 125
LDI r2, 115
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
