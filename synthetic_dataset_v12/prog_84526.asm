; DESCRIPTION: Places a green 46x109 rectangle at position (209, 30).
; PLAN: r0=209(x), r1=30(y), r2=46(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 30
LDI r2, 46
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
