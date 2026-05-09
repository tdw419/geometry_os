; DESCRIPTION: Renders a white box of size 15x46 starting at (487, 135).
; PLAN: r0=487(x), r1=135(y), r2=15(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 135
LDI r2, 15
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
