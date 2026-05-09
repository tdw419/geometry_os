; DESCRIPTION: Renders a orange box of size 51x111 starting at (165, 130).
; PLAN: r0=165(x), r1=130(y), r2=51(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 130
LDI r2, 51
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
