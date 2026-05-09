; DESCRIPTION: Renders a black box of size 99x103 starting at (296, 46).
; PLAN: r0=296(x), r1=46(y), r2=99(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 46
LDI r2, 99
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
