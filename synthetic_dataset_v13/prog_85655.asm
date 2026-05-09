; DESCRIPTION: Renders a cyan box of size 26x97 starting at (165, 133).
; PLAN: r0=165(x), r1=133(y), r2=26(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 133
LDI r2, 26
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
