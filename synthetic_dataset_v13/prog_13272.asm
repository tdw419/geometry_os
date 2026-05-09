; DESCRIPTION: Renders a cyan box of size 86x97 starting at (313, 129).
; PLAN: r0=313(x), r1=129(y), r2=86(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 129
LDI r2, 86
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
