; DESCRIPTION: Places a blue 91x44 rectangle at position (403, 3).
; PLAN: r0=403(x), r1=3(y), r2=91(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 3
LDI r2, 91
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
