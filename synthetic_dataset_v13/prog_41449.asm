; DESCRIPTION: Places a green 70x109 rectangle at position (17, 140).
; PLAN: r0=17(x), r1=140(y), r2=70(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 140
LDI r2, 70
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
