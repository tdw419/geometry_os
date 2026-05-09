; DESCRIPTION: Places a green 113x40 rectangle at position (136, 38).
; PLAN: r0=136(x), r1=38(y), r2=113(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 38
LDI r2, 113
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
