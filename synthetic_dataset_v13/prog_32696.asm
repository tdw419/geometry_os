; DESCRIPTION: Places a magenta 93x68 rectangle at position (273, 174).
; PLAN: r0=273(x), r1=174(y), r2=93(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 174
LDI r2, 93
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
