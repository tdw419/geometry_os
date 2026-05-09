; DESCRIPTION: Renders a red box of size 13x68 starting at (246, 103).
; PLAN: r0=246(x), r1=103(y), r2=13(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 103
LDI r2, 13
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
