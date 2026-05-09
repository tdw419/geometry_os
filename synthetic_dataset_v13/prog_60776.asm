; DESCRIPTION: Places a green 21x109 rectangle at position (475, 4).
; PLAN: r0=475(x), r1=4(y), r2=21(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 4
LDI r2, 21
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
