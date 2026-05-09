; DESCRIPTION: Places a green 40x113 rectangle at position (200, 52).
; PLAN: r0=200(x), r1=52(y), r2=40(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 52
LDI r2, 40
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
