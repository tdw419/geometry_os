; DESCRIPTION: Renders a black box of size 55x67 starting at (352, 46).
; PLAN: r0=352(x), r1=46(y), r2=55(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 46
LDI r2, 55
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
