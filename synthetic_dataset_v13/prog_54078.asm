; DESCRIPTION: Places a green 50x46 rectangle at position (6, 153).
; PLAN: r0=6(x), r1=153(y), r2=50(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 153
LDI r2, 50
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
