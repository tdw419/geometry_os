; DESCRIPTION: Renders a green box of size 45x46 starting at (291, 210).
; PLAN: r0=291(x), r1=210(y), r2=45(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 210
LDI r2, 45
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
