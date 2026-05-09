; DESCRIPTION: Places a green 10x16 rectangle at position (434, 17).
; PLAN: r0=434(x), r1=17(y), r2=10(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 17
LDI r2, 10
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
