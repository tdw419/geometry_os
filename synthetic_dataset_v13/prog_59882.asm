; DESCRIPTION: Places a green 103x20 rectangle at position (297, 98).
; PLAN: r0=297(x), r1=98(y), r2=103(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 98
LDI r2, 103
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
