; DESCRIPTION: Renders a orange box of size 33x113 starting at (242, 118).
; PLAN: r0=242(x), r1=118(y), r2=33(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 118
LDI r2, 33
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
