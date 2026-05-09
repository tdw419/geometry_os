; DESCRIPTION: Renders a black box of size 68x27 starting at (321, 197).
; PLAN: r0=321(x), r1=197(y), r2=68(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 197
LDI r2, 68
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
