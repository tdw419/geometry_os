; DESCRIPTION: Places a red 28x50 rectangle at position (87, 39).
; PLAN: r0=87(x), r1=39(y), r2=28(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 39
LDI r2, 28
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
