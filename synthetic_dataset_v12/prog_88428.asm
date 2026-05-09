; DESCRIPTION: Places a green 85x60 rectangle at position (296, 83).
; PLAN: r0=296(x), r1=83(y), r2=85(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 83
LDI r2, 85
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
