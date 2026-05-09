; DESCRIPTION: Renders a white box of size 18x35 starting at (420, 146).
; PLAN: r0=420(x), r1=146(y), r2=18(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 146
LDI r2, 18
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
