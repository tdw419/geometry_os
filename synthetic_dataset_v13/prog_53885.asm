; DESCRIPTION: Places a red 12x111 rectangle at position (65, 10).
; PLAN: r0=65(x), r1=10(y), r2=12(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 10
LDI r2, 12
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
