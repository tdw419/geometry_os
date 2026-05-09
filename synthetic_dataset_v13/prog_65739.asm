; DESCRIPTION: Renders a white box of size 65x16 starting at (6, 113).
; PLAN: r0=6(x), r1=113(y), r2=65(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 113
LDI r2, 65
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
