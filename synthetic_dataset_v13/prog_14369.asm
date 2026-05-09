; DESCRIPTION: Renders a black box of size 84x17 starting at (255, 107).
; PLAN: r0=255(x), r1=107(y), r2=84(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 107
LDI r2, 84
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
