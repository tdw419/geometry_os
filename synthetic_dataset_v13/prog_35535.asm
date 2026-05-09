; DESCRIPTION: Places a blue 50x39 rectangle at position (340, 204).
; PLAN: r0=340(x), r1=204(y), r2=50(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 204
LDI r2, 50
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
