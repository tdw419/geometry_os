; DESCRIPTION: Places a red 32x50 rectangle at position (255, 121).
; PLAN: r0=255(x), r1=121(y), r2=32(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 121
LDI r2, 32
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
