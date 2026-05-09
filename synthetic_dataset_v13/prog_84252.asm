; DESCRIPTION: Renders a cyan box of size 114x13 starting at (90, 16).
; PLAN: r0=90(x), r1=16(y), r2=114(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 16
LDI r2, 114
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
