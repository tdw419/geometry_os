; DESCRIPTION: Renders a cyan box of size 13x26 starting at (123, 217).
; PLAN: r0=123(x), r1=217(y), r2=13(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 217
LDI r2, 13
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
