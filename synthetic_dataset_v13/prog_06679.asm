; DESCRIPTION: Renders a red box of size 104x103 starting at (13, 130).
; PLAN: r0=13(x), r1=130(y), r2=104(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 130
LDI r2, 104
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
