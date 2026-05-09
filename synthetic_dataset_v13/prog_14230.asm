; DESCRIPTION: Places a green 43x98 rectangle at position (90, 7).
; PLAN: r0=90(x), r1=7(y), r2=43(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 7
LDI r2, 43
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
