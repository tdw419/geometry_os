; DESCRIPTION: Places a green 46x54 rectangle at position (315, 30).
; PLAN: r0=315(x), r1=30(y), r2=46(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 30
LDI r2, 46
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
