; DESCRIPTION: Places a blue 103x65 rectangle at position (21, 17).
; PLAN: r0=21(x), r1=17(y), r2=103(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 17
LDI r2, 103
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
