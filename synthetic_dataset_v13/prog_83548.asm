; DESCRIPTION: Places a green 85x70 rectangle at position (315, 182).
; PLAN: r0=315(x), r1=182(y), r2=85(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 182
LDI r2, 85
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
