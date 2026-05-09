; DESCRIPTION: Renders a red box of size 70x67 starting at (260, 50).
; PLAN: r0=260(x), r1=50(y), r2=70(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 50
LDI r2, 70
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
