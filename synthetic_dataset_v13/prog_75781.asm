; DESCRIPTION: Places a green 21x81 rectangle at position (480, 38).
; PLAN: r0=480(x), r1=38(y), r2=21(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 38
LDI r2, 21
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
