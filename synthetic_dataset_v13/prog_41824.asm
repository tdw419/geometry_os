; DESCRIPTION: Places a red 90x26 rectangle at position (328, 180).
; PLAN: r0=328(x), r1=180(y), r2=90(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 180
LDI r2, 90
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
