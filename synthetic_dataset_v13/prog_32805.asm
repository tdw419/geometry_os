; DESCRIPTION: Places a red 60x48 rectangle at position (127, 68).
; PLAN: r0=127(x), r1=68(y), r2=60(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 68
LDI r2, 60
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
