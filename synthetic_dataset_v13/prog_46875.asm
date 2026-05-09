; DESCRIPTION: Renders a black box of size 32x62 starting at (392, 131).
; PLAN: r0=392(x), r1=131(y), r2=32(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 131
LDI r2, 32
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
