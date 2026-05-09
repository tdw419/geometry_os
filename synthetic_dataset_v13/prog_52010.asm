; DESCRIPTION: Places a red 25x85 rectangle at position (16, 46).
; PLAN: r0=16(x), r1=46(y), r2=25(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 46
LDI r2, 25
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
