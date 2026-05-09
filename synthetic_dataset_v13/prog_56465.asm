; DESCRIPTION: Renders a black box of size 30x49 starting at (255, 142).
; PLAN: r0=255(x), r1=142(y), r2=30(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 142
LDI r2, 30
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
