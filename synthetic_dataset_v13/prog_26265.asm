; DESCRIPTION: Renders a black box of size 68x109 starting at (309, 21).
; PLAN: r0=309(x), r1=21(y), r2=68(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 21
LDI r2, 68
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
