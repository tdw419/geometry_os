; DESCRIPTION: Renders a blue box of size 55x102 starting at (400, 46).
; PLAN: r0=400(x), r1=46(y), r2=55(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 46
LDI r2, 55
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
