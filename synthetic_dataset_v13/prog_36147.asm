; DESCRIPTION: Places a red 50x44 rectangle at position (108, 150).
; PLAN: r0=108(x), r1=150(y), r2=50(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 150
LDI r2, 50
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
