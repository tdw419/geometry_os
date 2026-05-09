; DESCRIPTION: Places a magenta 16x27 rectangle at position (87, 200).
; PLAN: r0=87(x), r1=200(y), r2=16(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 200
LDI r2, 16
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
