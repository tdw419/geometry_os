; DESCRIPTION: Renders a cyan box of size 81x117 starting at (416, 13).
; PLAN: r0=416(x), r1=13(y), r2=81(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 13
LDI r2, 81
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
