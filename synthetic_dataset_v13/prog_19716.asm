; DESCRIPTION: Places a red 46x60 rectangle at position (50, 50).
; PLAN: r0=50(x), r1=50(y), r2=46(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 50
LDI r2, 46
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
