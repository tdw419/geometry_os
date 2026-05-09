; DESCRIPTION: Renders a cyan box of size 117x97 starting at (385, 122).
; PLAN: r0=385(x), r1=122(y), r2=117(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 122
LDI r2, 117
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
