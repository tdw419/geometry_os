; DESCRIPTION: Places a red 16x52 rectangle at position (350, 178).
; PLAN: r0=350(x), r1=178(y), r2=16(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 178
LDI r2, 16
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
