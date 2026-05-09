; DESCRIPTION: Renders a white box of size 21x111 starting at (25, 16).
; PLAN: r0=25(x), r1=16(y), r2=21(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 16
LDI r2, 21
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
