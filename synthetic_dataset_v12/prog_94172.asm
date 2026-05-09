; DESCRIPTION: Renders a black box of size 62x48 starting at (433, 46).
; PLAN: r0=433(x), r1=46(y), r2=62(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 46
LDI r2, 62
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
