; DESCRIPTION: Places a green 79x40 rectangle at position (320, 173).
; PLAN: r0=320(x), r1=173(y), r2=79(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 173
LDI r2, 79
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
