; DESCRIPTION: Renders a white box of size 105x46 starting at (313, 113).
; PLAN: r0=313(x), r1=113(y), r2=105(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 113
LDI r2, 105
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
