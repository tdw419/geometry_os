; DESCRIPTION: Renders a green box of size 26x10 starting at (198, 103).
; PLAN: r0=198(x), r1=103(y), r2=26(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 103
LDI r2, 26
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
