; DESCRIPTION: Places a red 13x18 rectangle at position (180, 178).
; PLAN: r0=180(x), r1=178(y), r2=13(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 178
LDI r2, 13
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
