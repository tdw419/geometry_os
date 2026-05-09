; DESCRIPTION: Places a green 38x100 rectangle at position (127, 153).
; PLAN: r0=127(x), r1=153(y), r2=38(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 153
LDI r2, 38
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
