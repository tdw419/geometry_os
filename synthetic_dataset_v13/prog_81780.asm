; DESCRIPTION: Places a red 16x117 rectangle at position (173, 90).
; PLAN: r0=173(x), r1=90(y), r2=16(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 90
LDI r2, 16
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
