; DESCRIPTION: Renders a yellow box of size 67x42 starting at (69, 180).
; PLAN: r0=69(x), r1=180(y), r2=67(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 180
LDI r2, 67
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
