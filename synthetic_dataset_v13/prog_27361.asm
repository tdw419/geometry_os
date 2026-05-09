; DESCRIPTION: Places a green 98x113 rectangle at position (305, 101).
; PLAN: r0=305(x), r1=101(y), r2=98(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 101
LDI r2, 98
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
