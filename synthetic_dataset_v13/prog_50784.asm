; DESCRIPTION: Places a yellow 16x42 rectangle at position (400, 1).
; PLAN: r0=400(x), r1=1(y), r2=16(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 1
LDI r2, 16
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
