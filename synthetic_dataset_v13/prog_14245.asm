; DESCRIPTION: Renders a blue box of size 51x39 starting at (403, 108).
; PLAN: r0=403(x), r1=108(y), r2=51(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 108
LDI r2, 51
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
