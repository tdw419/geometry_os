; DESCRIPTION: Renders a green box of size 108x103 starting at (137, 113).
; PLAN: r0=137(x), r1=113(y), r2=108(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 113
LDI r2, 108
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
