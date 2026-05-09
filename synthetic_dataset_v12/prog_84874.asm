; DESCRIPTION: Renders a red box of size 98x113 starting at (402, 38).
; PLAN: r0=402(x), r1=38(y), r2=98(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 38
LDI r2, 98
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
