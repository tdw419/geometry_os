; DESCRIPTION: Places a white 62x54 rectangle at position (127, 198).
; PLAN: r0=127(x), r1=198(y), r2=62(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 198
LDI r2, 62
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
