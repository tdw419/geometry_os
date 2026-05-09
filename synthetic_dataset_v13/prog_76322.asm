; DESCRIPTION: Places a green 83x91 rectangle at position (328, 8).
; PLAN: r0=328(x), r1=8(y), r2=83(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 8
LDI r2, 83
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
