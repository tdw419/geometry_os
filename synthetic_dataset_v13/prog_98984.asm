; DESCRIPTION: Places a green 29x39 rectangle at position (333, 180).
; PLAN: r0=333(x), r1=180(y), r2=29(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 180
LDI r2, 29
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
