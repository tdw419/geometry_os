; DESCRIPTION: Renders a white box of size 27x58 starting at (441, 198).
; PLAN: r0=441(x), r1=198(y), r2=27(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 198
LDI r2, 27
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
