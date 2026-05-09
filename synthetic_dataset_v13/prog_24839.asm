; DESCRIPTION: Renders a green box of size 86x25 starting at (123, 55).
; PLAN: r0=123(x), r1=55(y), r2=86(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 55
LDI r2, 86
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
