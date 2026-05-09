; DESCRIPTION: Places a green 40x84 rectangle at position (434, 146).
; PLAN: r0=434(x), r1=146(y), r2=40(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 146
LDI r2, 40
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
